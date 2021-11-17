require 'rails_helper'

RSpec.describe BuildQueryString do
  describe '.call' do
    let(:context) { described_class.call(address: address) }
    let(:user) { build_stubbed(:user) }
    let(:address) { build(:address, user: user) }

    it 'returns an xml_body' do
      expected_string = "<AddressValidateRequest USERID='#{Rails.application.credentials.usps[:user]}'><Revision>1</Revision><Address ID='0'><Address1>#{user.full_name}</Address1><Address2>#{address.street}</Address2><City>#{address.city}</City><State>#{address.state}</State><Zip5>#{address.zip_code}</Zip5><Zip4></Zip4></Address></AddressValidateRequest>" # rubocop:disable Layout/LineLength

      expect(context.xml_body).to eq(expected_string)
    end
  end
end
