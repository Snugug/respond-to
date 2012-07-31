require 'compass'
require 'breakpoint'

extension_path = File.expand_path(File.join(File.dirname(__FILE__), ".."))
Compass::Frameworks.register('respond-to', :path => extension_path)
