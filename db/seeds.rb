# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Member.destroy_all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'members.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  if row['End ( if not recurring)'] === "lifetime"
    @end_date = "01/01/2099".to_date
  elsif row['End ( if not recurring)']
    @end_date = Date.strptime(row['End ( if not recurring)'], "%m/%d/%Y") + 2000.years
  else
    @end_date = nil
  end

  if row['Start']
    @start_date = Date.strptime(row['Start'], "%m/%d/%Y") + 2000.years
  else
    @start_date = nil
  end
  m = Member.new
  m.start_date = @start_date
  m.end_date = @end_date
  m.first_name = row['Fname']
  m.last_name = row['Lname']
  m.clothes_balance = row['Clothes Balance']
  m.active = row['Active?']
  m.status = row['Status']
  m.member_type = row['Type']
  m.referred_by = row['Referred by']
  m.boost_credit = row['Boost Credit']
  m.birthday_boost = row['Birthday Boost']
  m.cost = row['Cost']
  m.email = row['Email']
  m.add_on = row['Add On']
  m.flagged_member = false
  m.password = "shwop1"
  m.save
  p "#{m.first_name} #{m.last_name} saved"
end

p "There are now #{Member.count} rows in the member table"
