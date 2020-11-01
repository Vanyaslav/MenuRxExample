# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MenuRxExample' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MenuRxExample
    pod 'RxSwift', '~> 5'
    pod 'RxCocoa', '~> 5'
    pod 'RxSwiftExt'
    pod 'ReusableKit'
    pod 'RxDataSources'
    
    post_install do |installer|
       installer.pods_project.targets.each do |target|
          if target.name == 'RxSwift'
             target.build_configurations.each do |config|
                if config.name == 'Debug'
                   config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D', 'TRACE_RESOURCES']
                end
             end
          end
       end
    end

end
