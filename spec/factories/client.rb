FactoryGirl.define do
  factory :client, :class => Klarna::Client do
    hostname     { ENV['KLARNA_URL'] }
    port         { ENV['KLARNA_PORT'] }
    store_id     { ENV['KLARNA_STORE_ID'].to_i }
    store_secret { ENV['KLARNA_STORE_SECRET'] }

    initialize_with do
      new(:hostname => hostname, :port => port, :store_id => store_id, :store_secret => store_secret)
    end
  end
end
