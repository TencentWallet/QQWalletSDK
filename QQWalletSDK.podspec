
Pod::Spec.new do |s|
  s.name         = "QQWalletSDK"
  s.version      = "0.0.1"
  s.summary      = "QQWalletSDK."

  s.description  = <<-DESC
                   A longer description of QQWalletSDK in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "https://github.com/yishuiliunian/QQWalletSDK"
  s.license      = 'MIT'
  s.author             = { "Stone Dong" => "stonedong@tencent.com" }
   s.platform     = :ios, '5.0'
  s.source       = { :git => "https://github.com/yishuiliunian/QQWalletSDK.git", :tag => "0.0.1"}
  s.source_files  = 'QQWalletSDK/Classes', 'QQWalletSDK/Classes/**/*.{h,m}'
  s.exclude_files = 'QQWalletSDK/Classes/Exclude'
  s.requires_arc = true

end
