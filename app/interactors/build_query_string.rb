class BuildQueryString
  include Interactor

  # Accepts and address and returns the xml_query
  def call
    context.xml_body = build_query_string.squish.gsub('> <', '><')
  end

  private

  def build_query_string
    <<~XML
      <AddressValidateRequest  USERID='#{Rails.application.credentials.usps[:user]}'>
        <Revision>1</Revision>
        <Address ID='0'>
          <Address1>#{user.full_name}</Address1>
          <Address2>#{address.street}</Address2>
          <City>#{address.city}</City>
          <State>#{address.state}</State>
          <Zip5>#{address.zip_code}</Zip5>
          <Zip4></Zip4>
        </Address>
      </AddressValidateRequest>
    XML
  end

  def user
    @user ||= address.user
  end

  def address
    context.address
  end
end
