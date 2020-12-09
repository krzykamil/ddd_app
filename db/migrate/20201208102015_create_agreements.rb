class CreateAgreements < ActiveRecord::Migration[6.0]
  def change
    create_table :agreements do |t|
      t.references :owner, polymorphic: true, index: true
      t.references :company
      t.float :percentage
      t.string :status
    end
  end
end
