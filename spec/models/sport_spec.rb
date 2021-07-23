require 'rails_helper'

describe Sport, type: :model do
  context 'Associations' do
    it { should have_many(:events) } 
    it { should have_many(:club_sports) } 
    it { should have_many(:clubs).through(:club_sports) } 
  end

  context 'Validations' do
    it "is valid with a first name, last name, email, phone_number is_admin, is_club_owner, is_event_admin" do
      sport = Sport.create(name: "Tennis")
      expect(sport).to be_valid
    end

    it "is invalid without a name" do
      sport = Sport.new(name: nil)
      sport.valid?
      expect(sport.errors[:name]).to include('can\'t be blank')
    end
  end
end
