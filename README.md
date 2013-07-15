# Klarna::Client

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'klarna-client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install klarna-client

## Usage

# 1st way (one store configuration)
Klarna.configure do |config|
  config.hostname = 'payment.testdrive.klarna.com'
  config.port = 443
  config.store_id = 7
  config.store_secret = 'dr.alban'
end

Klarna::Client.get_addresses('410321-9202',2,5,'')


# 2nd way (multiple stores - each store has its own client)
client = Klarna::Client.new(:hostname => 'payment.testdrive.klarna.com', :port => 443 :store_id => 7 :store_secret => 'dr.alban')
client.get_addresses('410321-9202',2,5,'')

## Testing

# In order to run this gem's tests you need to create a '.env' file in the application root path with your env variables configuation:
	KLARNA_URL: <hostname>
	KLARNA_PORT: <port>
	KLARNA_STORE_ID: <store_id>
	KLARNA_STORE_SECRET: <store_secret>

# When running the tests for the first time on your machine, the http calls will be ran against your environment variables. The response will be recorded to a fixture file at 'spec/fixtures/vcr_cassettes', using 'vcr' gem. The next time you'll run the tests these recordings will be used instead of triggering an actual http call.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request