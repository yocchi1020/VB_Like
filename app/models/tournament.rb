class Tournament < ApplicationRecord
  belongs_to :member, optional: true
  has_many :favorites
  has_many :teams
  has_one_attached :image

#enumで都道府県を設定する
  # class Tournament < ActiveRecord::Base
  #   enum prefecture: Settings.prefectures.to_h
  # end
end
