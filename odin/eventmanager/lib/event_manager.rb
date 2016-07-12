require 'csv'
require 'sunlight/congress'
require 'erb'
require 'date'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id,form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

def clean_phone(homephone, name, phone_numbers)
  homephone.to_s.gsub!(/\D+/,"")
  if homephone.length < 10 || homephone.length > 11 || (homephone.length == 11 && homephone[0] != 1)
    phone_numbers << "#{name}'s number: 0000000000"
  elsif homephone.length > 10 && homephone[0] == 1
    phone_numbers << "#{name}'s number: #{homephone[1..-1]}"
  else
    phone_numbers << "#{name}'s number: #{homephone}"
  end
end

def time_targeting(regdate, time_hash, day_hash)
	jelly = DateTime.strptime(regdate, '%m/%d/%y %H:%M')
  	time_hash[jelly.hour] += 1
  	day_hash[jelly.wday] +=1
end

puts "EventManager initialized."

contents = CSV.open '/Users/Home/Desktop/event_manager/event_attendees.csv', headers: true, header_converters: :symbol

template_letter = File.read "/Users/Home/Desktop/event_manager/form_letter.erb"
erb_template = ERB.new template_letter

time_hash = Hash.new(0)
day_hash = Hash.new(0)
phone_numbers = []

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  
  homephone = clean_phone(row[:homephone], name, phone_numbers)

  regdate = time_targeting(row[:regdate], time_hash, day_hash)

  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letters(id,form_letter)
   
end
puts("***** Registrations by hour (format is hour => and # of registrations *****")
puts time_hash
puts("***** Registrations by days (format is day code => and # of registrations) *****")
puts day_hash
puts("Sunday's day code is 0, Monday's day code is 1, and so on.")
puts("***** Phone #s of attendees *****")
puts phone_numbers

#could not get Colin's # to register as a proper # for some reason