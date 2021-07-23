require 'rails_helper'

describe User, type: :model do
  context 'Associations' do
    it { should have_many(:clubs) } 
    it { should have_many(:events).through(:clubs) } 
  end

  context 'Validations' do
    it "is valid with a first name, last name, email, phone_number is_admin, is_club_owner, is_event_admin" do
      user = User.create(first_name: "Jean",
                        last_name: "Krupa",
                        email: "jkrupa@hotmail.fr",
                        phone_number: "0695500784",
                        is_admin: false,
                        is_event_admin: false,
                        is_club_admin: false,
                        password:"azerty")
      expect(user).to be_valid
    end


    it "is invalid without a first name" do
      user = User.new(first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include('can\'t be blank')
    end

    it "is invalid without a last name" do
      user = User.new(last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include('can\'t be blank')
    end

    it "is invalid without an email address" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include('can\'t be blank')
    end

    it "is invalid without a password" do
      user = User.new(password: nil)
      user.valid?
      expect(user.errors[:password]).to include('can\'t be blank')
    end

    it "is sets by default all admin columns to false" do
      user = User.create(first_name: "Jean",
        last_name: "Krupa",
        email: "jkrupa@hotmail.fr",
        phone_number: "0695500784",
        password:"azerty")

      expect(user.is_admin).to eq(false)
      expect(user.is_club_admin).to eq(false)
      expect(user.is_event_admin).to eq(false)
    end


    it "is invalid with a duplicate email address" do
      User.create(
        first_name: 'Jean',
        last_name: 'KRUPA',
        email: 'toto@toto.com',
        password: 'tototototo')
      user = User.new(
        first_name: 'Jean',
        last_name: 'KRUPA',
        email: 'toto@toto.com',
        password: 'tototototo')
      user.valid?
      expect(user.errors[:email]).to include('has already been taken')
    end
  end
end
