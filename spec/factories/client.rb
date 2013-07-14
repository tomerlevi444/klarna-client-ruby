FactoryGirl.define do
	factory :client, :class => Klarna::Client do
		hostname     'kred.test.machine'
		port         443
		store_id     1
		store_secret 'supersecret'

		initialize_with do 
			new(:hostname => hostname, :port => port, :store_id => store_id, :store_secret => store_secret)
		end
	end
end