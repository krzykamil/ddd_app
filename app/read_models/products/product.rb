module Products
  class Product < ApplicationRecord
    self.table_name = "products"
    belongs_to :company, class_name: "Company"
  end
end
