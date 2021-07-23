FactoryBot.define do
  factory :user do
    first_name   { 'Jean' }
    last_name    { Faker::Name.unique.name }
    email        { Faker::Internet.email }
    phone_number { '0695500784' }
    password     { Faker::Internet.password }
  end
  
  factory :team do
    name { Faker::Name.unique.name }
    owner factory: :user
  end
  
  factory :team_member do
    team
    user
    role { "ADMIN" }
  end
  
  factory :section do
    name { Faker::Name.unique.name }
    price_in_cents { 1 }
  end
  
  factory :team_section do
    team
    section
  end
  
  factory :challenge do
    section
    name { Faker::Name.unique.name }
  end

  factory :exercise do
    name { Faker::Name.unique.name }
    challenge
  end
  
  factory :lecture do
    name { Faker::Name.unique.name }
    challenge
  end

  factory :workshop do
    name { Faker::Name.unique.name }
    user
    address { Faker::Address.full_address }
    capacity { rand(4..30) }
    duration { 7 }
    image_url  { "https://images.unsplash.com/photo-1592564630984-7410f94db184?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1929&q=80"}
    price      { 250 }
    start_date { Time.zone.now}
  end

end