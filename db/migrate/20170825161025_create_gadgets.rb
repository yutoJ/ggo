class CreateGadgets < ActiveRecord::Migration[5.0]
  def change
    create_table :gadgets do |t|
      t.string :gadget_type
      t.text :description
      t.integer :price
      t.integer :owner
      t.string :city
      t.boolean :active
      t.integer :instant, default: 0
      t.string :listing_name

      t.timestamps
    end
  end
end
