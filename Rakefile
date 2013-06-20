# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
#require 'bubble-wrap/all'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.frameworks += %w(QuartzCore)
  app.name = 'Istikhara'
  app.identifier = 'com.saaridev.istikhara'
  app.deployment_target = "5.0"
  app.development do
    app.codesign_certificate = "iPhone Developer: Syed Rizvi (8PW637K7EM)"
    app.provisioning_profile = "/Volumes/Data Drive/Dropbox/Dev/Istikhara.mobileprovision"
  end
end

