Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "Patience"
s.summary = "Patience is an easy to use UIActivityIndicator made in Swift 3"
s.requires_arc = true

# 2
s.version = "2.0"

# 3
s.license = "MIT"

# 4
s.author = { "Felix Ayala" => "felix1262@gmail.com" }

# 5
s.homepage = "https://github.com/rockbarato/Patience"

# 6
s.source = { :git => "https://github.com/rockbarato/Patience.git", :tag => "#{s.version}"}

# 7
s.framework = "UIKit"

# 8
s.source_files = "Patience/**/Patience.{swift}"

end
