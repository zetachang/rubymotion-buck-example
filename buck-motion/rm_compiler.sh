#!/bin/sh
/usr/bin/env \
RM_DATADIR_PATH="/Library/RubyMotion/data/ios/$SDK_VERSION" \
VM_PLATFORM="iPhoneSimulator" \
VM_KERNEL_PATH="/Library/RubyMotion/data/ios/$SDK_VERSION/iPhoneSimulator/kernel-x86_64.bc" \
VM_OPT_LEVEL="0" \
/usr/bin/arch -arch x86_64 \
"/Library/RubyMotion/bin/ruby" \
--uses-bs "/Library/RubyMotion/data/ios/$SDK_VERSION/BridgeSupport/RubyMotion.bridgesupport" \
--uses-bs "/Library/RubyMotion/data/ios/$SDK_VERSION/BridgeSupport/UIKit.bridgesupport" \
--uses-bs "/Library/RubyMotion/data/ios/$SDK_VERSION/BridgeSupport/Foundation.bridgesupport"  \
--uses-bs "/Library/RubyMotion/data/ios/$SDK_VERSION/BridgeSupport/CoreGraphics.bridgesupport" \
--uses-bs "/Library/RubyMotion/data/ios/$SDK_VERSION/BridgeSupport/CoreFoundation.bridgesupport" \
--uses-bs "/Library/RubyMotion/data/ios/$SDK_VERSION/BridgeSupport/CFNetwork.bridgesupport" \
--uses-bs "/Library/RubyMotion/data/ios/$SDK_VERSION/BridgeSupport/CoreAudio.bridgesupport" \
--emit-llvm-fast ""
