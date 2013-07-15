FactoryGirl.define do
  factory :connection, :class => Klarna::Connection do
    xmlrpc_hostname { ENV['KLARNA_URL'] }
    xmlrpc_port     { ENV['KLARNA_PORT'] }

    initialize_with { new(xmlrpc_hostname, xmlrpc_port) }
  end
end
