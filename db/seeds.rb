# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)


namespace :options do
	if ENV['count']
		@count = ENV['count'].to_i
		if @count > 1000
			@count = 1000
		end
	end
	if ENV['mode'] == "delete"
		Course.delete_all
	end
end

index = 1
if Course.count > 0
	a = Course.find(:last)
	index = a.id
end	
	
@count.times do 
	Course.create(:name => "Course #{index}", :description => "diipaapa #{index}")
	index = index+1	
end			