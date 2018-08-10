# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'NCMBTodoSwift' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for NCMBTodoSwift
  pod 'NCMB', :git => 'https://github.com/NIFCloud-mbaas/ncmb_ios.git'
  pod 'Bolts'
  pod 'FacebookCore'
  pod 'FacebookLogin'
  pod 'FacebookShare'
    
  target 'NCMBTodoSwiftTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'NCMBTodoSwiftUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

plugin 'cocoapods-keys', {
  :project => "NCMBTodoSwift",
  :keys => [
    "applicationKey",
    "clientKey"
  ]}