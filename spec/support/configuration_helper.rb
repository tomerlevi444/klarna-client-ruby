module ConfigurationHelper
  def setup_configuration
    Klarna.configure do |config|
      config.hostname     = ENV['KLARNA_URL']
      config.port         = ENV['KLARNA_PORT']
      config.store_id     = ENV['KLARNA_STORE_ID'].to_i
      config.store_secret = ENV['KLARNA_STORE_SECRET']
    end
  end
end
