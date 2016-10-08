# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.sdk_version = "9.3"
  #app.deployment_target = "9.3"
  app.name = 'HelloMotion'
end

puts Motion::Project::App.config.bindir
