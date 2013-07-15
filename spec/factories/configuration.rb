FactoryGirl.define do
  factory :configuration, :class => Klarna::Configuration do
    hostname     { ENV['KLARNA_URL'] }
    port         { ENV['KLARNA_PORT'] }
    store_id     { ENV['KLARNA_STORE_ID'].to_i }
    store_secret { ENV['KLARNA_STORE_SECRET'] }

    initialize_with { new(hostname, port, store_id, store_secret) }
  end
end
