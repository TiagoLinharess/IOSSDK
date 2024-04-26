Pod::Spec.new do |spec|
  spec.name         = 'SharpnezCore'
  spec.version      = '1.2.2'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/TiagoLinharess/IOSSDK.git'
  spec.authors      = { 'Tiago Linhares' => 'tiagolinharessouza@gmail.com' }
  spec.summary      = 'This is a software development kit'
  spec.source       = { :git => 'https://github.com/TiagoLinharess/IOSSDK.git', :tag => 'core-1.2.2' }
  spec.platforms    = { :ios => "16.4" }
  spec.swift_version = '5.8.1'
  spec.vendored_frameworks = 'SharpnezCore.xcframework'
  spec.framework    = 'SystemConfiguration'
end
