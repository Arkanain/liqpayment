class CreateLiqpayRequests < ActiveRecord::Migration
  def change
    create_table :liqpay_requests do |t|
      t.string  :amount
      t.string  :description
      t.integer :status

      t.timestamps null: false
    end
  end
end
