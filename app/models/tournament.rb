class Tournament < ApplicationRecord
  belongs_to :member
  has_many :favorites
  has_many :teams
end
