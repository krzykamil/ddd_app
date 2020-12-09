class AddRelationships < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :company
    add_reference :sales, :product
    add_reference :sales, :company
    add_reference :sales, :sales_person
    add_reference :companies, :platform
  end
end
