PROJECT_NAME=WeatherExplorer
.DEFAULT_GOAL := help
FASTLANE=$(BUNDLE) exec fastlane
FRAMEWORKS_FOLDER=Carthage/PreBuiltFrameworks
BUNDLE=$(if $(rbenv > /dev/null), rbenv exec bundle, bundle)
CARTHAGE_FRAMEWORKS=ls Carthage/Build/iOS/*.framework | grep "\.framework" | cut -d "/" -f 4 | cut -d "." -f 1 | xargs -I '{}'

lint: ## run lint
	$(FASTLANE) lint

test: ## run unit tests
	$(FASTLANE) test

ui_test: ## run UI tests
	$(FASTLANE) ui_test

setup: ## install required tools
	brew update
	brew upgrade
	brew cleanup
	brew install carthage rbenv git swiftlint
	rbenv install -s 2.6.4
	rbenv global 2.6.4
	rbenv exec gem install bundler
	$(BUNDLE) install
	make install

install: ## install gems, certificates, fetch prebuilt carthage frameworks
	$(BUNDLE) install
	make carthage_bootstrap

reset_simulator: ## reset the iPhone simulator
	osascript -e 'tell application "Simulator" to quit'
	xcrun simctl shutdown all
	xcrun simctl erase all

wipe: ## delete all cached outputs, kill and reset all simulators
	rm -rf ~/Library/Developer/Xcode/{DerivedData,Archives,Products}
	osascript -e 'tell application "iOS Simulator" to quit'
	osascript -e 'tell application "Simulator" to quit'
	xcrun simctl erase all

xcode_autocorrect_files: ## reformat and autocorrect all swift files in the project
	swiftlint --fix --format

generate_certificate_pin: ## create the certificate pinning file
	openssl s_client -connect api.weatherstack.com:443 -showcerts < /dev/null | openssl x509 -outform DER > apiWeatherStack.der

carthage_clean: ## clean carthage artifacts
	rm -rf Carthage
	mkdir -p $(FRAMEWORKS_FOLDER)

carthage_bootstrap: carthage_clean ## bootstrap carthage frameworks
	./carthage.sh bootstrap --platform iOS --no-use-binaries --cache-builds

carthage_update: ## update carthage packages
	./carthage.sh update --platform iOS --no-use-binaries --cache-builds

carthage_copy: ## copy carthage frameworks
	$(CARTHAGE_FRAMEWORKS) env SCRIPT_INPUT_FILE_0=Carthage/build/iOS/'{}'.framework SCRIPT_INPUT_FILE_COUNT=1 carthage copy-frameworks

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'