Pod::Spec.new do |s|
   s.name         = "HLBGuide"
   s.version      = "0.0.5"
   s.summary      = "New user guide view."
   s.homepage     = "https://github.com/BOB-Module/HLBGuide"
   s.license      = 'MIT'
   s.author       = { "Huang Libo" => "LiboHwang+IM@gmail.com" }
   s.source       = { :git => "https://github.com/BOB-Module/HLBGuide.git", :tag => s.version }

   s.source_files = 'HLBGuide/*.{h,m}'
   
   s.ios.frameworks = 'Foundation', 'UIKit'
   s.ios.deployment_target = '9.0'
 end