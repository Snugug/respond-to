require 'compass'
require 'breakpoint'

extension_path = File.expand_path(File.join(File.dirname(__FILE__), ".."))
Compass::Frameworks.register('respond-to', :path => extension_path)

module Sass::Script::Functions
  def is_class_or_id(string)
    assert_type string, :String
    Sass::Script::Bool.new(string.start_with?('.', '#'))
  end
  declare :is_class_or_id, :args => [:string]
end
