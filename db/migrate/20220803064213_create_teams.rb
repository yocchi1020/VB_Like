class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.integer :category_id
      t.integer :prefecture_id
      t.string :name
      t.text :overview
      t.string :achievement
      t.string :contact_address
      t.text :entry_field

      t.timestamps
    end
  end
end
