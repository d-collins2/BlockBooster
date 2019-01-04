require 'date'
class Movie < ApplicationRecord
  has_many :tickets
  has_many :users, through: :tickets

  def self.english_movie
    all.select do |movie|
      movie.language == 'en'
    end
  end

  def self.upcoming
    english_movie.select do |movie|
      Date.parse(movie.release_date) > Date.today
    end
  end

  def self.now_playing
    english_movie.select do |movie|
      Date.parse(movie.release_date) <= Date.today
    end
  end

  def self.search(search)
    where('name LIKE ?', "%#{search}%")
  end
end

def valid?
  Movie.all.any? do |m|
    name == m.name && release_date == m.release_date
  end
end
