FactoryBot.define do
  factory :address do
    street { '123 Lee St' }
    city { 'City' }
    state { 'State' }
    zip_code { '12345' }
  end
end
