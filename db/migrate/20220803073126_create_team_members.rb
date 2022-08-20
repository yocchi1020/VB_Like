class CreateTeamMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :team_members do |t|
      t.references :team, foreign_key: true
      t.references :member, foreign_key: true
      t.boolean :is_manager, default: false
      t.string :status

      t.timestamps
    end
  end
end
