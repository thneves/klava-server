require 'rails_helper'

RSpec.describe Klaviyo do
  let(:attributes) do
    {
      first_name: 'john',
      last_name: 'doe',
      email: 'john@doe.com',
      phone_number: '99998888',
      birth_date: Date.new
    }
  end

  let(:profile) { Profile.new(attributes) }
  let(:instance) { described_class.new(profile) }

  describe '.add_profile' do
    before do
      allow(described_class).to receive(:new).and_return(instance)
      allow(instance).to receive(:add_profile)
    end

    subject { described_class.add_profile(profile) }

    it 'calls add_profile on the instance' do
      expect(instance).to receive(:add_profile)

      subject
    end

    it 'creates an instance with correct params' do
      expect(described_class).to receive(:new).with(profile).and_return(instance)

      subject
    end
  end

  describe '#add_profile', :vcr do
    subject { instance.add_profile }

    it 'makes a requests to add a profile to the list' do
      expect(subject.code).to eq 204

      subject
    end
  end
end
