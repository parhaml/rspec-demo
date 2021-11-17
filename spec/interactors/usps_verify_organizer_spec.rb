require 'rails_helper'

RSpec.describe UspsVerifyOrganizer do
  # array matcher
  it 'organizes the following interactors' do
    expected_array = [BuildQueryString, CallUsps]

    expect(described_class.organized).to match_array(expected_array)
  end

  # exact order
  it 'organizes the following interactors' do
    expected_array = [BuildQueryString, CallUsps]

    expect(described_class.organized).to eq(expected_array)
  end

  # Plain ol Ruby
  [BuildQueryString, CallUsps].each do |interactor|
    it "includes #{interactor}" do
      expect(described_class.organized).to include(interactor)
    end
  end
end
