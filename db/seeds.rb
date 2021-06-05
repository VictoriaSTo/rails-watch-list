# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

url = "http://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key>"
data = JSON.parse(open(url).read)
data["results"].each do |result| 
  title = result["original_title"]
  overview = result["overview"]
  poster_path = result["poster_path"]
  poster_url = "https://image.tmdb.org/t/p/w500#{poster_path}"
  rating = result["vote_average"]
  movie = Movie.new(title: "#{title}", overview: "#{overview}", poster_url: "#{poster_url}", rating: "#{rating}")
  movie.save
end
