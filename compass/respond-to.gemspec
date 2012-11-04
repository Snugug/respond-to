# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  # General Project Information
  s.name = "respond-to"
  s.version = "2.6"
  s.date = "2011-11-03"
  s.rubyforge_project = "respond-to"
  s.rubygems_version = "1.7.2"
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2")
  
  # Author Information
  s.authors = ["Sam Richard"]
  s.email = ["snugug@gmail.com"]
  s.homepage = "https://github.com/Snugug/respond-to"
  
  # Project Description
  s.description = "Semantic Media Query Handling"
  s.summary = "Use the Variable Driven Respond-to Mixin (https://gist.github.com/2493551) in your project today!"
  
  # Files to Include
  s.files = [
    "lib/respond-to.rb", 
    "stylesheets/_respond-to.scss", 
  ]
  
  # Dependent Gems
  s.add_dependency 'breakpoint',    '>= 1.3'
end