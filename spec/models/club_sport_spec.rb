require 'rails_helper'

describe ClubSport, type: :model do
  context 'Associations' do
    it { should belong_to(:club) } 
    it { should belong_to(:sport) } 

  end

  context 'Validations' do
    it "is valid with a first name, last name, email, phone_number is_admin, is_club_owner, is_event_admin" do
      club = create(:club)
      sport = create(:sport)
      club_sport = ClubSport.create(
        club: club,
        sport: sport,
      )
      expect(club_sport).to be_valid
    end

    it "is invalid without a sport" do
      club = ClubSport.new(sport: nil)
      club.valid?
      expect(club.errors[:sport]).to include('must exist')
    end
    it "is invalid without an club" do
      club = ClubSport.new(club: nil)
      club.valid?
      expect(club.errors[:club]).to include('must exist')
    end
  end
end
