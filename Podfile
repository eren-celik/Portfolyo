# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'portfolyo' do
  use_frameworks!

  pod 'SDWebImage', '~> 5.0'
  pod 'Moya', '~> 15.0'
  pod 'JGProgressHUD'
  pod 'Parchment', '~> 3.2'

  target 'portfolyoTests' do
    inherit! :search_paths
  end

end

post_install do |installer_representation|
    installer_representation.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
	    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
        end
    end
end
