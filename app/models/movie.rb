require 'date'
class Movie < ApplicationRecord
  has_many :tickets
  has_many :users, through: :tickets

  def self.upcoming
    self.all.select do |movie|
      Date.parse(movie.release_date) > Date.today
    end
  end

  def self.now_playing
    self.all.select do |movie|
      Date.parse(movie.release_date) <= Date.today
    end
  end
end
