# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'SETTING UP DEFAULT USER LOGIN for Geek Finder'
user = User.create! :name => 'DC  Pacific Technology Inc', :email => 'dcpacificw2k@yahoo.com', :password => '959818', :password_confirmation => '959818'

# + Dec.27.2011
# user.confirmed_at = Time.now 
# user.save

puts 'New user created: ' << user.name

# + Dec.27.2011
puts 'SETTING UP DEFAULT job for Geek Finder'
job = Job.create!( :title => "Rails 3 developer", :url => "http://foreveryoung2012.blogspot.com/2011_12_01_archive.html", 
                   :company_name => "SKF technology inc", :job_type => "Full-time", :occupation => "Server side",
                   :location => "GVRD", :user_id => 1,
                   :description => "This is SKF Rails development job!<br>Ppl are all ripped off!", :apply_information => "Only serious applies" )

puts 'New job created: ' 
