require 'csv'


######## Adjusts zipcode to proper format  #####################
def cleanZipcode (zipcode)
  zipcode.to_s.rjust(5, "0")[0..4]
end
####These 3 lines are equivalent to the below####

# def cleanZipcode (zipcode)
#   if zipcode === nil    #Checks to see if zipcode field is nil.
#     zipcode = "00000"
#   else
#     if zipcode.length < 5   #if zipcode is short, add 0s to the front.
#       zipcode = zipcode.rjust 5, "0"
#     else
#       zipcode = zipcode[0..4]   # if zipcode is long or 5 digits, make 5 digits.
#     end
#   end
# end
#############################################################################



puts "EventManager Initialized"
# to call the column of data by the header, you must turn the header into a symbol using 'header_converters: :symbol'
contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

# # Ruby CSV Parser by index
# contents.each do |row|
#   name = row[2]
#   p name
# end


contents.each do |row|
  name = row[:first_name] # Ruby CSV Parser by row title.
  zipcode = cleanZipcode(row[:zipcode]) # zipcode = the output of each row's zipcode after passing through the method.
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
