class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.text       :image,null: false
      t.string     :name,null: false
      t.text       :nated_food,null: false
      t.text       :dislike_word,null: false
      t.text       :hate_human,null: false
      t.text       :weaknes,null: false
      t.text       :remark,null: false
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
