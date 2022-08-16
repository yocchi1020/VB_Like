class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tournaments
  has_many :favorites, dependent: :destroy
  has_many :team_members
  has_many :team_comments, dependent: :destroy
  has_many :teams, through: :team_members

  def self.guest
    find_or_create_by!(email: 'guest@example.com', name: 'guest', nickname: 'guest', telephone_number: '09000000000', team_id: '1') do |member|
      member.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
end
