class CreateTeamComments < ActiveRecord::Migration[6.1]
  def change
    create_table :team_comments do |t|
      t.integer :member_id
      t.integer :team_id
      t.string :introduction

      t.timestamps
    end
  end
end
