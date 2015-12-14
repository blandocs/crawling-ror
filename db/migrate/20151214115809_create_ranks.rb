class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.string :food
      t.string :nickname
      t.text :content
      t.integer :star

      t.timestamps null: false
    end
  end
end
