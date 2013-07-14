FactoryGirl.define do
	factory :configuration, :class => Klarna::Configuration do
		hostname     'kred.test.machine'
      	port         443
      	store_id     1
      	store_secret 'supersecret'

      	initialize_with { new(hostname, port, store_id, store_secret) }
	end
end