# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'

target 'ChuckNorrisApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ChuckNorrisApp
  pod 'Alamofire'
  pod 'lottie-ios'
  
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'YES'
      if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 14.0
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
      end
    end
  end
end
