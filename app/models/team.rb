class Team < ApplicationRecord
  has_many :team_members
  has_many :team_comments
  has_one_attached :image

  validates :name, presence: true
  validates :overview, presence: true
  validates :contact_address, presence: true

#enumで都道府県を設定する
  # class Team < ActiveRecord::Base
  #   enum prefecture: Settings.prefectures.to_h
  # end
end
