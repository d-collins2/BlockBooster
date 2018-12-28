require 'rest-client'
require 'json'

class Movie < ApplicationRecord
  has_many :tickets
  has_many :users, through: :tickets

  
end
