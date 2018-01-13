# Exercise: Build a terminal dictionary app
# • Create a new ruby file called dictionary_app.rb

# • The program should ask the user to enter a word, then use the wordnik API to show the word’s definition, top example, and pronunciation: http://developer.wordnik.com/docs.html#!/word

# Bonus: Write your program in a loop such that the user can keep entering new words without having to restart the program. Give them the option of entering q to quit.

require "unirest" 

looking_up_words = true

while looking_up_words

  system "clear"

  puts "Enter a word"
  puts "=" * 40
  word = gets.chomp


  definition_url = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/definitions?limit=10&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

  definitions = definition_url.body

  puts 
  puts
  puts "DEFINITIONS"
  puts "=" * 40

  definitions.each.with_index do |definition, index|
    puts "#{index + 1}. #{definition["text"]}"
    puts 
  end 

  puts 
  puts 

  top_example_url = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/topExample?useCanonical=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

  top_example = top_example_url.body["text"]


  puts "TOP EXAMPLE"
  puts "=" * 40
  puts top_example

  puts
  puts 

  pronunciation_url = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5
  ")
  pronunciations = pronunciation_url.body


  puts "PRONOUNCIATIONS"
  puts "=" * 40

  pronunciations.each.with_index do |pronunciation, index|
    puts "#{index + 1}. #{pronunciation["raw"]}"
    puts 
    end

  puts "Press Enter to look up another word, otherwise press q to exit"
  user_input = gets.chomp

  if user_input == "q"
    looking_up_words = false
  end
end 
system "clear"
puts "Thanks for looking up words with me."


