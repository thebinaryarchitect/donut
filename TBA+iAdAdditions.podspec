Pod::Spec.new do |s|
  s.name		= 'TBA-iAdAdditions'
  s.version		= '1.0.0'
  s.summary		= 'iAd additions'
  s.homepage		= 'http://www.thebinaryarchitect.com'
  s.license		= 'MIT'
  s.author		= { 'tba' => 'thebinaryarchitect@gmail.com'}
  s.source		= { :git => 'https://thebinaryarchitect@bitbucket.org/thebinaryarchitect/donut.git', :branch => 'master' }

  s.platform		= :ios, '8.0'
  s.requires_arc	= true
  
  s.source_files	= 'TBA+iAd/*.{h,m}'

  s.module_name		= 'TBA_StoreKitAdditions'
end