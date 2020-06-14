platform :ios, '12.0'

def tools
  pod 'SwiftLint', '~> 0.30.1'
  pod 'AlignedCollectionViewFlowLayout'
end

def service_layer
  pod 'NodeKit', :git => 'https://github.com/surfstudio/NodeKit', :tag => '3.0.3'
  pod 'AlamofireImage', '~> 4.0.0-beta.1'
end

target 'Translator' do
  use_frameworks!

  tools
  service_layer

  target 'TranslatorTests' do
    tools
    service_layer
  end

end
