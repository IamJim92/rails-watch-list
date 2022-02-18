# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "json"


# Work on at home - whenever i returns a movie title from faker that isnt unique, causes error
# puts 'cleaning up database'
# Movie.destroy_all
# puts 'database is clean'

# puts 'creating movies'
# 50.times do
#   movie = Movie.create!(
#     title: Faker::Movie.title,
#     overview: Faker::Movie.quote,
#     poster_url: Faker::Internet.url,
#     rating: rand(0.0..10.0).round(1)
#   )
#   puts "movie #{movie.id} is created"
# end
# puts "finished"

# Movie seed
puts 'cleaning up database'
Movie.destroy_all
puts 'database is clean'
puts 'creating movies'
url = "http://tmdb.lewagon.com/movie/top_rated"
movie_serialized = URI.open(url).read
top_movies = JSON.parse(movie_serialized)
i = 0
while i < 20
  puts "creating movie"
  movie = Movie.new(
    title:top_movies["results"][i]["title"],
    overview:top_movies["results"][i]["overview"],
    poster_url:top_movies["results"][i]["poster_path"],
    rating:top_movies["results"][i]["vote_average"],
   )
  movie.save
  puts movie.title
  puts movie.rating
  i += 1
end


# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
# puts "finished"

# List seed
puts "cleaning lists"
List.destroy_all
puts "creating lists"
List.create(name: "Paul's list")
List.create(name: "John's list")
List.create(name: "George's list")
List.create(name: "Ringo's list")
puts "finished"
