class Favorite < ApplicationRecord
  belongs_to :member
  belongs_to :tournament

  validates_uniqueness_of :tournament_id, scope: :member_id
end
