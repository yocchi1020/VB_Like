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
    member = find_by(email: 'guest@example.com')
    return member if member.present?

    member =
      new(
        email: 'guest@example.com',
        name: 'guest',
        nickname: 'guest',
        telephone_number: '09000000000',
        password: SecureRandom.urlsafe_base64
      )

    team =
      Team.find_or_create_by!(
        owner: member,
        name: 'ゲストチーム',
        prefecture_id: '13',
        category_id: '1',
        overview: 'ゲストチームです',
        achievement: '都リーグ２部',
        contact_address: 'ゲスト09000000000',
        entry_field: '自由に記入します'
      )
    TeamMember.find_or_create_by!(team: team, member: member)

    member
  end
end
