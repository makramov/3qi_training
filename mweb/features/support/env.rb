require 'rubygems'
require 'rspec'
require 'rspec/expectations'
require 'appium_lib'
require 'cucumber/ast'
require 'watir-webdriver'


# Create a custom World class so we don't pollute `Object` with Appium methods
class AppiumWorld
end

# Load the desired configuration from appium.txt, create a driver then
# Add the methods to the world
caps = Appium.load_appium_txt file: File.expand_path('./', __FILE__), verbose: true
# appium_txt = File.absolute_path(__FILE__).gsub('env.rb', 'appium.txt')
# caps = Appium.load_settings file: appium_txt, verbose: true

Appium::Driver.new(caps)
Appium.promote_appium_methods AppiumWorld

World do
  AppiumWorld.new
end

# Before {
# $driver.start_driver
#      @browser = Watir::Browser.new($driver.driver)

# }
# After { $driver.driver_quit }
