class Team < ApplicationRecord
  has_many :team_members
  has_many :team_comments, dependent: :destroy
  has_many :members
  has_one_attached :image

  validates :name, presence: true
  validates :overview, presence: true
  validates :contact_address, presence: true


end
