
Pod::Spec.new do |s|

  s.name         = "RangeUISlider"
  s.version      = "4.0.1"
  s.summary      = "A highly customizable iOS range selection slider"
  s.description  = <<-DESC
An iOS range selection slider compatible with UIKit and SwiftUI. Developed using autolayout and highly customizable using IBDesignabled and IBInspectable or programmatically. It support also RTL (right to left) languages automatically out of the box.
                   DESC
  s.homepage     = "https://github.com/chicio/RangeUISlider"
  s.screenshots  = "https://raw.githubusercontent.com/chicio/RangeUISlider/master/Screenshots/rangeuislider-example.png"
  s.license      = { :type => "MIT", :file => "LICENSE.md" }
  s.author             = { "chicio" => "fabrizio.duroni@gmail.com" }
  s.social_media_url   = "https://github.com/chicio"
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/chicio/RangeUISlider.git", :tag => "#{s.version}" }
  s.source_files  = "Source", "Source/**/*.{h,m}", "Source/**/*.swift"
  s.exclude_files = "Source/Exclude"
  s.swift_version = '5.0'
  s.weak_framework = 'SwiftUI'
  
end
