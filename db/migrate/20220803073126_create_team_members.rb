class CreateTeamMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :team_members do |t|
      t.integer :member_id
      t.integer :team_id

      t.timestamps
    end
  end
end
