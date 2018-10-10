require 'capybara'
require 'capybara/cucumber'
require 'yaml'
require 'httparty'

$env_type = ENV['AMBIENTE']
$env_file = YAML.load_file(File.dirname(__FILE__) + '/env.yaml')

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = $env_file[$env_type]['web']
  config.default_max_wait_time = 10
end
