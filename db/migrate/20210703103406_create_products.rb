class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :seller, foreign_key: {to_table: :users}
      t.string :product_name
      t.integer :product_amount
      t.string :product_info

      t.timestamps
    end
  end
end
