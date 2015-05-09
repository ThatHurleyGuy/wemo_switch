require "wemo_switch/version"
require "yaml"
require "savon"

HTTPI.adapter = :net_http

module Wemo
  class Switch
    ROUTE = "/upnp/control/basicevent1"

    def initialize(endpoint)
      @endpoint = endpoint
    end

    def toggle_outlet
      _try_all_ports do |client|
        response = client.call(:get_binary_state)
        state = response.body[:get_binary_state_response][:binary_state]
        state = state == "1" ? "0" : "1"
        client.call(:set_binary_state, :message => {"BinaryState" => state})
        return true
      end
    end

    def get_state
      _try_all_ports do |client|
        response = client.call(:get_binary_state)
        state = response.body[:get_binary_state_response][:binary_state]
        return state == "1"
      end
    end

    def _try_all_ports
      [49151, 49153, 49154].each do |port|
        begin
          client = Savon.client(:wsdl => _wsdl, :endpoint => _outlet_endpoint(port), :open_timeout => 0.5, :read_timeout => 0.5)
          yield client
        rescue Net::ReadTimeout, Errno::ECONNREFUSED
          next
        end
      end
      raise "Couldn't connect..."
    end

    def _root
      File.dirname(__dir__)
    end

    def _config_dir
      File.join(_root, "config")
    end

    def _wsdl
      File.join(_config_dir, YAML.load_file(File.join(_config_dir, "wemo.yml"))['wsdl'])
    end

    def _outlet_endpoint(port)
      "http://" + @endpoint + ":" + port.to_s + ROUTE
    end
  end
end
