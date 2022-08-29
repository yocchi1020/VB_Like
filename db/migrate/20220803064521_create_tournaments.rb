class CreateTournaments < ActiveRecord::Migration[6.1]
  def change
    create_table :tournaments do |t|
      t.integer :category_id
      t.integer :prefecture_id
      t.integer :member_id
      t.string :name
      t.string :schedule
      t.string :place
      t.integer :team_number
      t.integer :price
      t.text :overview
      t.string :url

      t.timestamps
    end
  end
end
