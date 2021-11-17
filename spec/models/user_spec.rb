require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.associations' do
    it { should have_many :addresses }
  end

  describe '#full_name' do
    let(:user) { build(:user, first_name: first_name, last_name: last_name) }

    context 'when there is both a first and last name' do
      let(:first_name) { 'Lee' }
      let(:last_name) { 'Parham' }

      it "returns the 'first_name last_name' string" do
        expect(user.full_name).to eq('Lee Parham')
      end
    end

    context 'when there is only a first name' do
      let(:first_name) { 'Lee' }
      let(:last_name) { nil }

      it "returns the 'first_name' string" do
        expect(user.full_name).to eq('Lee')
      end
    end

    context 'when there is only a last name' do
      let(:first_name) { nil }
      let(:last_name) { 'Parham' }

      it "returns the 'last_name' string" do
        expect(user.full_name).to eq('Parham')
      end
    end
  end
end
