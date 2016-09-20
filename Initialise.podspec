Pod::Spec.new do |s|
  s.name             = "Initialise"
  s.version          = "1.0"
  s.summary          = "Simple initialisation and configuration in Swift."
  s.description      = <<-DESC

Programmatic UI can have advantages of composition, reusability and testability over Storyboards, however it can become cumbersome to configure all of the subviews if there are a lot of elements in the hierarchy.

This library from extensions to common UIKit and Foundation components with convenience initialisers setting the common properties on init. This can greatly simplify your programmatic UI code.
                        DESC
  s.homepage         = "https://github.com/joshc89/Initialise"
  s.license          = 'MIT'
  s.author           = { "Josh Campion" => "joshcampion89@gmail.com" }
  s.source           = { :git => "https://github.com/joshc89/Initialise.git", :tag => s.version.to_s }

  s.requires_arc          = true

  s.ios.deployment_target = '8.0'

  s.source_files          = 'Initialise/**/*.swift'
end
