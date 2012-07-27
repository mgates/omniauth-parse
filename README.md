# Omniauth::Parse::Com

This gem is an OmniAuth strategy for parse.com.
## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-parse'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-parse-com

## Usage

    use OmniAuth::Builder do
      provider :parse, {:application_id => "application_id", :rest_api_key => "rest_api_key"}
    end

    Whatever fields are in the user object will get put into the info hash.
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## TODO
 tests tests tests
