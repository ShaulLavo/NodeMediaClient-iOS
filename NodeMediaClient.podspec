Pod::Spec.new do |s|

  s.name          = 'NodeMediaClient'
  s.version       = '2.9.8'
  s.summary       = 'A live streaming SDK.'
  s.license       = { :type => 'Copyright', :text => 'Copyright 2021 NodeMedia Ltd. All rights reserved.' }
  s.homepage      = 'http://www.nodemedia.cn'
  s.author        = { 'Mingliang Chen' => 'illuspas@gmail.com' }
  s.source        = { :git => 'https://github.com/NodeMedia/NodeMediaClient-iOS.git', :tag => s.version }
  s.platform      = :ios, '9.0'
  s.source_files  = 'NodeMediaClient/NodeMediaClient.framework/Headers/*.{h}'
  s.vendored_frameworks = 'NodeMediaClient/NodeMediaClient.framework'
  s.public_header_files = 'NodeMediaClient/NodeMediaClient.framework/Headers/NodeMediaClient.h'
  s.libraries     = 'z'
  s.frameworks    = 'CoreMedia','AudioToolbox','VideoToolbox','AVFoundation'
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end
