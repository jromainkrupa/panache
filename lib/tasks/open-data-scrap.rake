# frozen_string_literal: true
require 'json'
require 'date'

namespace :event do
  desc "create events form open data json"
  task create: :environment do
    events_file = File.read('db/data/datagouv-events.json')
    hash = JSON.parse(events_file)
    hash.each do |row|

      if Date.parse(row["fields"]["date_start"]) > Date.today
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
        user_id: 1
      })
      end
    end
    p Event.all.count
  end
end
