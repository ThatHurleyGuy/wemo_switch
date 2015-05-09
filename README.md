# Wemo

This gem can be used to control wemo switch devices to control power outlets

## Installation

Add this line to your application's Gemfile:

    gem 'wemo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wemo

## Usage

```
wemo = Wemo.new("192.168.1.150") # Or any ip that the light controls
wemo.get_state # true if it's powered on, false if it's off
wemo.toggle_state # will turn the outlet on if it's currently off, and vice versa
```

## Running Tests
The test suite assumes there is a wemo endpoint active on the curent network at `192.168.1.150` and will actively switch that endpoint on and off for integration tests. You can override this by setting the `WEMO_ENDPOINT` env variable to a different value like so:

```
WEMO_ENDPOINT=192.168.1.255 rake
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/wemo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
