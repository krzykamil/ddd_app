class CreateCompanySalesPerson < ActiveRecord::Migration[6.0]
  def change
    create_table :company_sales_people do |t|
      t.references :company
      t.references :sales_person
    end
  end
end
