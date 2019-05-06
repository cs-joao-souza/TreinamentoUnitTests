platform :ios, '11.0'

target 'TreinamentoTests' do
  use_frameworks!

  pod 'SnapKit', '~> 4.2.0'

  target 'TreinamentoTestsTests' do
    inherit! :search_paths
    pod 'Quick', '~> 1.3.2'
    pod 'Nimble', '~> 7.3.2'
    pod 'Nimble-Snapshots', '~> 6.9.0'
  end
  
  target 'TreinamentoKIFTests' do
      inherit! :search_paths
      pod 'Quick', '~> 1.3.2'
      pod 'Nimble', '~> 7.3.2'
      pod 'KIF', '~> 3.7.4', :configurations => ['Debug']
  end

end
