class Category < ApplicationRecord
  has_many :teams
  has_many :tournaments
end
