# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
#require 'bubble-wrap/all'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.frameworks += %w(QuartzCore)
  app.name = 'zIstikhara'
  app.icons << 'icon.png'
  app.prerendered_icon = true
  app.identifier = 'com.saarcology.istikhara'
  app.deployment_target = "7.0"
  app.fonts = ["UthmanTN1_Ver07.otf", "LateefRegOT.ttf", "ScheherazadeRegOT.ttf"]
  app.development do
    app.codesign_certificate = "iPhone Developer: Syed Rizvi (8PW637K7EM)"
    app.provisioning_profile = "/Volumes/Data Drive/Dropbox/Dev/Istikhara.mobileprovision"
  end
end

