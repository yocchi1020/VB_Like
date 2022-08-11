class Tournament < ApplicationRecord
  belongs_to :member, optional: true
  has_many :favorites, dependent: :destroy
  has_many :teams
  has_one_attached :image

  #いいね機能　ログイン中のメンバーか判断する
  def favorited?(member)
   favorites.where(member_id: member.id).exists?
  end

end