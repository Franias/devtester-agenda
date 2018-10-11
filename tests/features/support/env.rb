require 'capybara'
require 'capybara/cucumber'
require 'yaml'
require 'httparty'
require 'selenium-webdriver'

$env_type = ENV['AMBIENTE']
$env_file = YAML.load_file(File.dirname(__FILE__) + '/env.yaml')

@browser = ENV['BROWSER']

caps = Selenium::WebDriver::Remote::Capabilities.chrome(
  'chromeOptions' => {
    'args' => ['--no-default-browser-check']
  }
)

if @browser.eql?('headless')
  Capybara.run_server = false
  Capybara.javscript_driver = :selenium

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(
      app,
      browser: :remote,
      url: 'http://selenium:4444/wd/hub',
      desired_capabilities: caps
    )
  end
end

Capybara.configure do |config|
  config.default_driver = if @browser == 'headless' || @browser == 'firefox'
                            :selenium
                          else
                            :selenium_chrome
                          end

  config.app_host = $env_file[$env_type]['web']
  config.default_max_wait_time = 10
end
