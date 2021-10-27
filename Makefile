PROJECT_NAME=CountryExplorer
.DEFAULT_GOAL := help
FASTLANE=$(BUNDLE) exec fastlane
BUNDLE=$(if $(rbenv > /dev/null), rbenv exec bundle, bundle)

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
	openssl s_client -connect api.countrylayer.com:443 -showcerts < /dev/null | openssl x509 -outform DER > countrylayer.der

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'