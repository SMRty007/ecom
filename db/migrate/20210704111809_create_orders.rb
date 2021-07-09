class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :customer
      t.integer    :amount
      t.boolean    :paid_status, default: :false
      t.timestamps
    end
  end
end
