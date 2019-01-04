require 'date'
class Movie < ApplicationRecord
  has_many :tickets
  has_many :users, through: :tickets

  def self.english_movies
    all.select do |movie|
      movie.language == 'en'
    end
  end

  def self.foreign_movies
    all.reject do |movie|
      movie.language == 'en'
    end
  end

  def self.upcoming
    english_movies.select do |movie|
      Date.parse(movie.release_date) > Date.today
    end
  end

  def self.for_upcoming
    foreign_movies.select do |movie|
      Date.parse(movie.release_date) > Date.today
    end
  end

  def self.now_playing
    english_movies.select do |movie|
      Date.parse(movie.release_date) <= Date.today
    end
  end

  def self.now_playing_foreign
    foreign_movies.select do |movie|
      Date.parse(movie.release_date) <= Date.today
    end
  end

  def self.search(search)
    where('name LIKE ?', "%#{search}%")
  end
end
