# Exercise: Build a terminal dictionary app
# • Create a new ruby file called dictionary_app.rb

# • The program should ask the user to enter a word, then use the wordnik API to show the word’s definition, top example, and pronunciation: http://developer.wordnik.com/docs.html#!/word

# Bonus: Write your program in a loop such that the user can keep entering new words without having to restart the program. Give them the option of entering q to quit.

require "unirest" 

puts "Enter a word"
puts "=" * 40
word = gets.chomp


definition_url = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/definitions?limit=10&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

# definition = definition_url.body[0]["text"]

definition.each.with_index do |definition, index|
  puts "#{index + 1}. #{definition["text"]}"
  puts 
end 

top_example_url = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{top_example}/topExample?useCanonical=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

top_example = top_example_url.body[0]["text"]

pronunciation_url = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5
")

pronunciation = pronunciation_url.body[0]["raw"]

puts definition
puts "=" * 40 
puts top_example
# puts "=" * 40 
# puts pronunciation
# puts "=" * 40 