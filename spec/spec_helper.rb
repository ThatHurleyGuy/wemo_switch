require 'bundler/setup'
Bundler.setup

require 'wemo_switch'

RSpec.configure do |config|
  WEMO_ENDPOINT = ENV.fetch("WEMO_ENDPOINT", "192.168.1.150")
end
