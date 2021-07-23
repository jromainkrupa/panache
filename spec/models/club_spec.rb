require 'rails_helper'

describe Club, type: :model do
  context 'Associations' do
    it { should belong_to(:admin) } 
    it { should have_many(:events) } 
    it { should have_many(:club_sports) } 
    it { should have_many(:sports).through(:club_sports) } 
  end

  context 'Validations' do
    it "is valid with a name, address, city, postal_code, image_url, website, mail" do
      club_admin = build(:user, is_club_admin: true)
      club = Club.create(
        name: "Tennis club de genas",
        address: "18 rue du repos",
        city: "Genas",
        postal_code: "69809",
        admin: club_admin,
        image_url: "www.image.png",
        website: "wwww.gens.com",
        mail: "contact@genas.com"
      )
      expect(club).to be_valid
    end

    it "is invalid without a name" do
      club = Club.new(name: nil)
      club.valid?
      expect(club.errors[:name]).to include('can\'t be blank')
    end
    it "is invalid without an address" do
      club = Club.new(address: nil)
      club.valid?
      expect(club.errors[:address]).to include('can\'t be blank')
    end
    it "is invalid without a city" do
      club = Club.new(city: nil)
      club.valid?
      expect(club.errors[:city]).to include('can\'t be blank')
    end

    it "is invalid without a postal_code" do
      club = Club.new(postal_code: nil)
      club.valid?
      expect(club.errors[:postal_code]).to include('can\'t be blank')
    end

    it "set the user is_club_admin to true" do
      club_admin = create(:user)
      club = create(:club, admin: club_admin)
      expect(club_admin.is_club_admin).to eq(true)
    end
  end
end
