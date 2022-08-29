class TeamComment < ApplicationRecord
  belongs_to :member
  belongs_to :team
  validates :introduction, presence: true, length: { maximum: 500 }
end
