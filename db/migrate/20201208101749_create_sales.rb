class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.string :status
      t.decimal :total
      t.integer :quantity
    end
  end
end
