# frozen_string_literal: true
require 'json'

namespace :event do
  desc "create events form open data json"
  task create: :environment do
    events_file = File.read('db/data/datagouv-events.json')
    hash = JSON.parse(events_file)
     hash.each do |row|

      sport = row['fields']['tags'].split(',').first  
      sport_id = Sport.find_or_create_by(name: sport).id   
      # Event.create()


      p Event.find_or_create_by!({
      name: "#{row["fields"]["title"]}",
      address: "#{row["fields"]["address"]}",
      city: "#{row["fields"]["city"]}",
      postal_code: "#{row["fields"]["department"]}",
      start_date: "#{row["fields"]["date_start"]}",
      end_date: "#{row["fields"]["date_end"]}",
      image_url: "#{row["fields"]["image"]}",
      price: "#{row["fields"]["pricing_info"]}",
      description: "#{row["fields"]["description"]} #{row["fields"]["space_time_info"]} #{row["fields"]["free_text"]}",
      website: row["fields"]["link"],
      user_id: 1,
      sport_id: sport_id
    })
    end
    p Sport.all.count
    p Event.all.count
  end
end
