class CallUsps
  require 'net/http'
  include Interactor

  VERIFY_URL = 'https://secure.shippingapis.com/ShippingAPI.dll?API=verify&XML='.freeze

  def call
    context.xml_response = make_request
  end

  private

  def make_request
    uri = URI("#{VERIFY_URL}#{context.xml_body}")

    response = Net::HTTP.post(uri, '')

    response.read_body
  end
end
