require 'spec_helper'

describe Klarna::Client do
  include ConfigurationHelper

  describe 'get_addresses' do
    let(:person_addresses) do
      [
        [
          'Testperson-se',
          'Approved',
          'Stårgatan 1',
          '12345',
          'Ankeborg',
          '209'
        ]
      ]
    end

    let(:company_addresses) do
      [
        [
          'Testcompany-se',
          'Stårgatan 1',
          '12345',
          'Ankeborg',
          '209'
      ],
        [
          'Testcompany-se',
          'lillegatan 1',
          '12334',
          'Ankeborg',
          '209'
        ]
      ]
    end

    describe 'instance method' do
      let(:client) { build(:client) }

      context 'given a person with PNO 410321-9202' do
        let(:pno) { '410321-9202' }

        it 'returns the expected response' do
          VCR.use_cassette 'get_addresses for PNO 410321-9202' do
            addresses = client.get_addresses(:pno => pno, :pno_encoding => 2, :type => 5)

            expect(addresses).to eq(person_addresses)
          end
        end
      end

      context 'given a company with PNO 002031-0132' do
        let(:pno) { '002031-0132' }

        it 'returns the expected response' do
          VCR.use_cassette 'get_addresses for PNO 002031-0132' do
            addresses = client.get_addresses(:pno => pno, :pno_encoding => 2, :type => 5)

            expect(addresses).to eq(company_addresses)
          end
        end
      end
    end

    describe 'class method' do
      before do
        setup_configuration
      end

      context 'given a person with PNO 410321-9202' do
        let(:pno) { '410321-9202' }

        it 'returns the expected response' do
          VCR.use_cassette 'get_addresses for PNO 410321-9202' do
            addresses = Klarna::Client.get_addresses(:pno => pno, :pno_encoding => 2, :type => 5)

            expect(addresses).to eq(person_addresses)
          end
        end
      end

      context 'given a company with PNO 002031-0132' do
        let(:pno) { '002031-0132' }

        it 'returns the expected response' do
          VCR.use_cassette 'get_addresses for PNO 002031-0132' do
            addresses = Klarna::Client.get_addresses(:pno => pno, :pno_encoding => 2, :type => 5)

            expect(addresses).to eq(company_addresses)
          end
        end
      end
    end
  end

  describe 'reserve_amount' do
    let(:person_address) do
      {
        :email           => 'always_approved@klarna.com',
        :telno           => '',
        :cellno          => '0762560000',
        :fname           => 'Testperson-se',
        :lname           => 'Approved',
        :company         => '',
        :careof          => '',
        :street          => 'Stårgatan 1',
        :house_number    => '',
        :house_extension => '',
        :zip             => '12345',
        :city            => 'Ankeborg',
        :country         => 209
      }
    end

    let(:goods_list) do
      [
        {
          :goods => {
            :artno    => 'article#',
            :title    => 'Article Foo',
            :price    => 199,
            :vat      => 25,
            :discount => 0,
            :flags    => 32
          },
          :qty => 1
        }
      ]
    end

    let(:params) do
      {
        :amount           => 199,
        :bank_info        => [],
        :billing_address  => person_address,
        :client_ip        => '',
        :comment          => '',
        :country          => 209,
        :currency         => 0,
        :delivery_address => person_address,
        :extra_info       => [],
        :flags            => 0,
        :gender           => '',
        :goods_list       => goods_list,
        :income_expense   => [],
        :language         => 138,
        :order_id_1       => '',
        :order_id_2       => '',
        :pclass           => -1,
        :pno              => pno,
        :pno_encoding     => 2,
        :reference        => '',
        :reference_code   => '',
        :session_id       => {},
        :shipment_info    => {:delay_adjust => 1},
        :travel_info      => []
      }
    end

    describe 'instance method' do
      let(:client) { build(:client) }

      context 'given a person with PNO 410321-9202' do
        let(:pno) { '410321-9202' }

        before do
          VCR.use_cassette 'reserve_amount for PNO 410321-9202' do
            @reservation = client.reserve_amount(params)
          end
        end

        it 'returns an array' do
          expect(@reservation).to be_an(Array)
        end

        describe 'first element of the response' do
          it 'is a string representing the reservation number' do
            expect(@reservation.first).to be_a(String)
          end
        end

        describe 'second element of the response' do
          it 'is an integer representing the reservation status' do
            expect(@reservation.last).to be_an(Integer)
          end
        end
      end
    end
  end
end
