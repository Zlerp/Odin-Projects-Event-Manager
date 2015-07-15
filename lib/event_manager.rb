require 'csv'
puts "EventManager Initialized"
# to call the column of data by the header, you must turn the header into a symbol using 'header_converters: :symbol'
contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

# # Ruby CSV Parser by index
# contents.each do |row|
#   name = row[2]
#   p name
# end

# # Ruby CSV Parser by row title.
contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode]
  puts "#{name}\tzip: #{zipcode}"
end



# ################## MANUAL PARSER ##########################
# # Displays CSV file and ouputs the 'Content'
# # the 'readlines' method outputs each line as an array.
# contents = File.readlines "event_attendees.csv"
# # puts each line into an array and then splits up the line by delimter adn assumes the header is the first row.
# contents.each_with_index do |line, index|
#   next if index === 0
#   columns = line.split(",")
#   name = columns[2]
#   p name
# end
# #########################################################
