# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  # General Project Information
  s.name = "respond-to"
  s.version = "2.0"
  s.date = "2011-06-18"
  s.rubyforge_project = "respond-to"
  s.rubygems_version = "1.7.2"
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2")
  
  # Author Information
  s.authors = ["Sam Richard"]
  s.email = ["snugug@gmail.com"]
  s.homepage = "https://github.com/Snugug/respond-to"
  
  # Project Description
  s.description = "Easy Media Query Handling"
  s.summary = "Use the Variable Driven Respond-to Mixin (https://gist.github.com/2493551) in your project today!"
  
  # Files to Include
  s.files = [
    "lib/respond-to.rb", 
    "stylesheets/_respond-to.scss", 
  ]
  
  # Dependent Gems
  s.add_dependency 'sass',          '~> 3.1'
  s.add_dependency 'breakpoint',    '>= 0.2'
end