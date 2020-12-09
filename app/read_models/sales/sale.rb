module Sales
  class Sale < ApplicationRecord
    self.table_name = "sales"

    belongs_to :sales_person
    belongs_to :company
  end
end
