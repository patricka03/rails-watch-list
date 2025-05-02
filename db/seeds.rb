require "json"
require "open-uri"

p 'Cleaning up the database'
Movie.destroy_all
List.destroy_all
Bookmark.destroy_all
p 'Database has been cleaned'


url = "https://tmdb.lewagon.com/movie/top_rated"
10.times do |i|
  puts "Importing movies from page #{i + 1}"
  movies_serialized = URI.parse("#{url}?page=#{i + 1}").read
  movie = JSON.parse(movies_serialized)["results"]
  movie.each do |movie|
    p "creating #{movie["title"]}"
    poster_url = "https://image.tmdb.org/t/p/original"
    Movie.create(
      title: movie["title"],
      overview: movie["overview"],
      poster_url: "#{poster_url}#{movie["backdrop_path"]}",
      rating: movie["vote_average"]
    )
  end
end
p 'Movies created'
