FactoryBot.define do
  factory :event_sponsor do
    sponsor { nil }
    event { nil }
  end

  factory :sponsor do
    name { "MyString" }
    image_url { "MyString" }
    sponsor_url { "MyString" }
  end

  factory :user do
    first_name   { 'Jean' }
    last_name    { Faker::Name.unique.name }
    email        { Faker::Internet.email }
    phone_number { '0695500784' }
    password     { Faker::Internet.password }
  end

  factory :sport do
    name { 'tennis'}
  end

  factory :club do
    name { "Tennis club de genas" }
    address { "18 rue du repos" }
    city { "Genas" }
    postal_code { "69809" }
    admin factory: :user
    image_url { "www.image.png" }
    website { "wwww.gens.com" }
    mail { "contact@genas.com" }
  end

  factory :event do
    name { "Tournoi de tennis" }
    address { "18 rue du repos" }
    city { "Genas" }
    postal_code { "69809" }
    start_date { Time.zone.now + 2.day }
    end_date { Time.zone.now + 3.day }
    organizer factory: :user
    sport 
    club
  end
end