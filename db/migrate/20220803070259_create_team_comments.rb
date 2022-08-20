class CreateTeamComments < ActiveRecord::Migration[6.1]
  def change
    create_table :team_comments do |t|
      t.references :member, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.string :introduction

      t.timestamps
    end
  end
end
