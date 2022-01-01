Pod::Spec.new do |spec|
  spec.name         = "ZHTCView"
  spec.summary      = "UITableView & UICollectionView"
  spec.version      = "0.0.2"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { "wangzhaohui" => "wanggoing@icloud.com" }
  spec.homepage     = "https://github.com/wanggoing/ZHTCView"
  spec.platform     = :ios, "9.0"
  spec.ios.deployment_target = '9.0'
  spec.source       = { :git => "https://github.com/wanggoing/ZHTCView.git", :tag => "#{spec.version.to_s}" }
  spec.source_files  = "ZHTCView", "ZHTCView/**/*.{h,m}"
  spec.public_header_files = 'ZHTCView/**/*.{h}'
end
