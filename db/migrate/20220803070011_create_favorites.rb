class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :member_id
      t.integer :tournament_id

      t.timestamps
    end
  end
end
