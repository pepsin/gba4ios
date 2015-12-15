source 'https://github.com/CocoaPods/Specs.git'

platform :ios, "7.0"

inhibit_all_warnings!

abstract_target 'GBA4iOS-Base' do
	pod 'RSTWebViewController', :git => 'https://github.com/rileytestut/RSTWebViewController-Legacy.git'
	pod "AFNetworking", "~> 2.4"
	pod "PSPDFTextView", :git => 'https://github.com/steipete/PSPDFTextView.git'
	pod "Dropbox-iOS-SDK", "~> 1.3.0"
	pod "CrashlyticsFramework", "~> 2.1.0"

	target 'GBA4iOS'
	target 'GBA4iOS-Simulator'
end
