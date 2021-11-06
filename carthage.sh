#!/usr/bin/env bash

# Well, shortly, Carthage builds fat frameworks, which means that the framework contains binaries for all supported architectures. 
# Until Apple Silicon was introduced it all worked just fine, but now there is a conflict as there are duplicate architectures (arm64 for devices and arm64 for simulator). 
# This means that Carthage cannot link architecture specific frameworks to a single fat framework.
# See More at: https://github.com/Carthage/Carthage/blob/master/Documentation/Xcode12Workaround.md
set -euo pipefail

xcconfig=$(mktemp /tmp/static.xcconfig.XXXXXX)
trap 'rm -f "$xcconfig"' INT TERM HUP EXIT

# For Xcode 12 make sure EXCLUDED_ARCHS is set to arm architectures otherwise
# the build will fail on lipo due to duplicate architectures.
echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200 = arm64 arm64e armv7 armv7s armv6 armv8' >> $xcconfig
echo 'EXCLUDED_ARCHS = $(inherited) $(EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_$(EFFECTIVE_PLATFORM_SUFFIX)__NATIVE_ARCH_64_BIT_$(NATIVE_ARCH_64_BIT)__XCODE_$(XCODE_VERSION_MAJOR))' >> $xcconfig

export XCODE_XCCONFIG_FILE="$xcconfig"
carthage "$@"