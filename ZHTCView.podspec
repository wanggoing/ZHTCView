Pod::Spec.new do |s|
  s.name         = "ZHTCView"
  s.summary      = "UITableView & UICollectionView"
  s.version      = "0.0.4"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "wangzhaohui" => "wanggoing@icloud.com" }
  s.homepage     = "https://github.com/wanggoing/ZHTCView"
  s.platform     = :ios, "9.0"
  s.ios.deployment_target = '9.0'
  s.source       = { :git => "https://github.com/wanggoing/ZHTCView.git", :tag => "#{s.version}" }
  s.source_files  = "ZHTCView", "ZHTCView/**/*.{h,m}"
  s.public_header_files = 'ZHTCView/**/*.{h}'
end
