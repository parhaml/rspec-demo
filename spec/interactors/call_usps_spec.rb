require 'rails_helper'

RSpec.describe CallUsps do
  describe '.call' do
    let(:context) { described_class.call(xml_body: xml_body) }
    let(:xml_body) { 'XML' }
    let(:uri) { "#{described_class::VERIFY_URL}#{xml_body}" }
    let(:xml_response) { 'XML_RESPONSE' }

    before do
      stub_request(:post, uri).to_return(status: 200, body: xml_response)
    end

    it 'returns the xml response' do
      expect(context.xml_response).to eq(xml_response)
    end
  end
end
