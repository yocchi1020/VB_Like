class Team < ApplicationRecord
  has_many :team_members
  has_many :team_comments, dependent: :destroy
  has_many :members
  belongs_to :category, optional: true
  belongs_to :prefecture, optional: true
  has_one_attached :image

  validates :name, presence: true
  validates :overview, presence: true
  validates :contact_address, presence: true


end
