class Team < ApplicationRecord
  has_many :team_members
  has_many :team_comments, dependent: :destroy
  has_many :members, through: :team_members, dependent: :destroy
  belongs_to :category, optional: true
  belongs_to :prefecture, optional: true
  belongs_to :owner, class_name: "Member"
  has_one_attached :image

  validates :name, presence: true
  validates :overview, presence: true
  validates :contact_address, presence: true
  validates :prefecture_id ,presence:true
  validates :category_id ,presence:true


end
