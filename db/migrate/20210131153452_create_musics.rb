class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.string :image
      t.references :post, foreign_key: true, null: false
      t.timestamps
    end
  end
end
