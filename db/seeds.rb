# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
#
def movies_hash(num)
  url = 'https://api.themoviedb.org/3/movie/now_playing?api_key=ea3605e61973db40253bbfaf6098e2b4&language=en-US&page='
  url += num.to_s
  response_string = RestClient.get(url)
  JSON.parse(response_string)
end

def upcoming_hash(num)
  url = 'https://api.themoviedb.org/3/discover/movie?api_key=ea3605e61973db40253bbfaf6098e2b4&language=en-US&sort_by=release_date.desc&include_adult=false&include_video=false&page='
  url += num.to_s
  response_string = RestClient.get(url)
  JSON.parse(response_string)
end

def top_rated_hash(num)
  url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=ea3605e61973db40253bbfaf6098e2b4&language=en-US&page='
  url += num.to_s
  response_string = RestClient.get(url)
  JSON.parse(response_string)
end

def movie_names(hash)
  hash['results'].map do |movie|
    {
      'name' => movie['title'],
      'release_date' => movie['release_date'],
      'overview' => movie['overview'],
      'image' => movie['poster_path'],
      'image2' => movie['backdrop_path'],
      'id' => movie['id'],
      'language' => movie['original_language']
    }
  end
end

def create_movie(hash)
  hash.each do |movie|
    m = Movie.find_or_initialize_by(name: movie['name'], release_date: movie['release_date'], overview: movie['overview'], image: movie['image'], image2: movie['image2'], language: movie['language'])
    if m.language == "en"
      m.save unless m.image.nil? || m.image2.nil? || m.overview.nil?
    end
  end
end

def run
  num = (91..100)
  num.each do |n|
    hash = movies_hash(n)
    upcoming = upcoming_hash(n)
    hash2 = movie_names(hash)
    upcoming2 = movie_names(upcoming)
    create_movie(hash2)
    puts n
    create_movie(upcoming2)
    puts n
  end
end

run
puts 'end'
