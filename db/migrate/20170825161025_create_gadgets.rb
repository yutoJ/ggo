class CreateGadgets < ActiveRecord::Migration[5.0]
  def change
    create_table :gadgets do |t|
      t.string :gadget_type
      t.text :description
      t.integer :price
      t.integer :owner, null: false
      t.string :city
      t.boolean :active, default: false
      t.integer :instant, default: 0
      t.string :listing_name

      t.timestamps
    end
  end
end
