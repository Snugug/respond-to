require 'compass'
require 'breakpoint'

extension_path = File.expand_path(File.join(File.dirname(__FILE__), ".."))
Compass::Frameworks.register('aura', :path => extension_path)
