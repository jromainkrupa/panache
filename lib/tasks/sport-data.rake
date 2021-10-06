# frozen_string_literal: true
require 'csv'

namespace :sport do
  desc "create sports from CSV"
  task create: :environment do
    filepath = 'db/data/sports.csv'
    csv_options = { col_sep: ',', quote_char: '"' }


    CSV.foreach(filepath, csv_options) do |row|
      Sport.find_or_create_by!({
        name: row[0]
      })
    end
    Sport.count
  end
end
