# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

def movies_hash
  response_string = RestClient.get('https://api.themoviedb.org/3/movie/now_playing?api_key=ea3605e61973db40253bbfaf6098e2b4&language=en-US&page=1')
  JSON.parse(response_string)
end

def movie_names
  hash = movies_hash
  hash['results'].map do |movie|
    {"name" => movie['title'], "release_date" => movie['release_date'], "overview" => movie['overview']}
  end
end

def create_movie
  movie_names.each do |movie|
      Movie.create(name: movie['name'], release_date: movie['release_date'], overview: movie['overview'])
  end
end

create_movie
