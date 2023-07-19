Pod::Spec.new do |spec|
  spec.name         = 'SharpnezSDK'
  spec.version      = '1.0.1'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/TiagoLinharess/IOSSDK.git'
  spec.authors      = { 'Tiago Linhares' => 'tiagolinharessouza@gmail.com' }
  spec.summary      = 'This is a software development kit'
  spec.source       = { :git => 'https://github.com/TiagoLinharess/IOSSDK.git', :tag => spec.version }
  spec.platforms    = { :ios => "16.4" }
  spec.swift_version = '5.8.1'
  spec.resources    = 'DesignSystem/Resources/Fonts/*.ttf'
  spec.source_files = 'SDKCore/**/*.swift', 'SDKCloud/**/*.swift', 'DesignSystem/**/*.swift',
  spec.framework    = 'SystemConfiguration'
end
