
Pod::Spec.new do |s|

  s.name         = "RangeUISlider"
  s.version      = "1.11.0"
  s.summary      = "A highly customizable iOS range selection slider"
  s.description  = <<-DESC
A highly customizable iOS range selection slider, developed using autolayout and completely customizable using IBDesignabled and IBInspectable.
                   DESC
  s.homepage     = "https://github.com/chicio/RangeUISlider"
  s.screenshots  = "https://raw.githubusercontent.com/chicio/RangeUISlider/master/Screenshots/01-mixed.png"
  s.license      = { :type => "MIT", :file => "LICENSE.md" }
  s.author             = { "chicio" => "fabrizio.duroni@gmail.com" }
  s.social_media_url   = "https://github.com/chicio"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/chicio/RangeUISlider.git", :tag => "#{s.version}" }
  s.source_files  = "Source", "Source/**/*.{h,m}"
  s.exclude_files = "Source/Exclude"

end
