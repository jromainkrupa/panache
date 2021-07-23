require 'rails_helper'

describe Event, type: :model do
  context 'Associations' do
    it { should belong_to(:club).optional } 
    it { should belong_to(:sport) } 
    it { should belong_to(:organizer) } 
  end

  context 'Validations' do
    it "is valid with a first name, last name, email, phone_number is_admin, is_club_owner, is_event_admin" do
      club  = build(:club)
      organizer  = club.admin
      sport = build(:sport)
      event = Event.create(
        name: "Tournoi de tennis",
        address: "18 rue du repos",
        city: "Genas",
        postal_code: "69809",
        start_date: Time.zone.now + 1.day,
        end_date: Time.zone.now + 3.day,
        organizer: organizer,
        sport: sport,
        club: club
      )
      expect(event).to be_valid
    end

    it "is valid without a club" do
      event = build(:event, club: nil)
      event.valid?
      expect(event).to be_valid
    end

    it "is invalid without an name" do
      event = Event.new(name: nil)
      event.valid?
      expect(event.errors[:name]).to include('can\'t be blank')
    end

    it "is invalid without an address" do
      event = Event.new(address: nil)
      event.valid?
      expect(event.errors[:address]).to include('can\'t be blank')
    end

    it "is invalid without a city" do
      event = Event.new(city: nil)
      event.valid?
      expect(event.errors[:city]).to include('can\'t be blank')
    end

    it "is invalid without a postal_code" do
      event = Event.new(postal_code: nil)
      event.valid?
      expect(event.errors[:postal_code]).to include('can\'t be blank')
    end

    it "is invalid without a start_date" do
      event = Event.new(start_date: nil)
      event.valid?
      expect(event.errors[:start_date]).to include('can\'t be blank')
    end

    it "is invalid without a end_date" do
      event = Event.new(end_date: nil)
      event.valid?
      expect(event.errors[:end_date]).to include('can\'t be blank')
    end

    it "is invalid without an organizer" do
      event = Event.new(organizer: nil)
      event.valid?
      expect(event.errors[:organizer]).to include('must exist')
    end

    it "is invalid without a sport" do
      event = Event.new(sport: nil)
      event.valid?
      expect(event.errors[:sport]).to include('must exist')
    end

    it "is invalid if start date after end date" do
      event = build(:event,
         start_date: Time.zone.now + 3.day,
        end_date: Time.zone.now)
        event.valid?
        expect(event.errors[:end_date]).to include('must be after the start date')
    end

    it "is invalid if start date is before today" do
      event = build(:event,
         start_date: Time.zone.now - 3.day,
        end_date: Time.zone.now + 3.day)
        event.valid?
        expect(event.errors[:start_date]).to include('must be in the future')
    end
  end
  context "#set_club_admin_as_organizer" do
    it "set the club's admin as the event organizer if club is given" do
      club = create(:club)
      event = build(:event, club: club, organizer: nil)
      event.set_club_admin_as_organizer
      event.save

      expect(event.organizer).to eq(club.admin)
    end

    it "should not work do anything if club is not given" do
      event = build(:event, club:nil)
      expect(event.set_club_admin_as_organizer).to eq(nil)
    end
  end

  context "#copy_club_address" do
    it "set the club's address, city, postal_code on the event " do
      club = create(:club)
      event = build(
        :event, 
        club: club, 
        address: nil,
        city: nil, 
        postal_code: nil
      )

      event.copy_club_address
      event.save

      expect(event.address).to eq(club.address)
      expect(event.postal_code).to eq(club.postal_code)
      expect(event.city).to eq(club.city)
    end

    it "should not work do anything if club is not given" do
      event = build(:event, club:nil)
      expect(event.copy_club_address).to eq(nil)
    end
  end

  context "#copy_club_infos" do
    it "set the club's address, city, postal_code on the event " do
      club = create(:club)
      event = build(
        :event, 
        club: club,
        organizer: nil, 
        address: nil,
        city: nil, 
        postal_code: nil
      )

      event.copy_club_infos
      event.save

      expect(event.address).to eq(club.address)
      expect(event.postal_code).to eq(club.postal_code)
      expect(event.city).to eq(club.city)
      expect(event.organizer).to eq(club.admin)
    end

    it "should not work do anything if club is not given" do
      event = build(:event, club:nil)
      expect(event.copy_club_infos).to eq(nil)
    end
  end
end
