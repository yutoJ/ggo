class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :star, default: 1
      t.references :owner, foreign_key: true, null: false
      t.references :gadget, foreign_key: true, null: false
      t.references :guest, foreign_key: true, null: false

      t.timestamps
    end
  end
end
