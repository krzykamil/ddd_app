class CreateSalesPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :sales_people do |t|
      t.string :name
    end
  end
end
