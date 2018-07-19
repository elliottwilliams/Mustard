Pod::Spec.new do |s|
  s.name         = "Mustard"
  s.version      = "0.5.0"
  s.summary      = "🌭 Mustard is a Swift library for tokenizing strings when splitting by whitespace doesn't cut it."

  s.homepage     = "https://github.com/mathewsanders/Mustard"
  s.license      = "MIT"
  s.author       = { "Mathew Sanders" => "email@address.com" }

  s.source       = { :git => "https://github.com/mathewsanders/Mustard.git", :tag => "#{s.version}" }
  s.source_files = "Sources/*.swift"

  s.swift_version = "4.1"
  s.ios.deployment_target = "8.0"
  s.tvos.deployment_target = "9.0"
  s.osx.deployment_target = "10.10"
end
