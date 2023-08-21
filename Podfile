# Uncomment the next line to define a global platform for your project
 source 'https://github.com/CocoaPods/Specs.git'
 platform :ios, '16.4'

def pods_for_tests
  pod 'SnapshotTesting', '~> 1.9.0'
end

def snap_kit_pod
  pod 'SnapKit', '~> 5.6.0'
end

target 'SDKCloud' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SDKCloud

  target 'SDKCloudTests' do
    # Pods for testing
  end

end

target 'SDKCore' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SDKCore

  target 'SDKCoreTests' do
    pods_for_tests
  end

end

target 'DesignSystem' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  target 'DesignSystemTests' do
    pods_for_tests
  end

end

target 'UIKitSDKSample' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  snap_kit_pod

end

target 'SwiftUISDKSample' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SDKSample

end
