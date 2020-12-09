class CompanySalesPerson < ApplicationRecord
  belongs_to :company
  belongs_to :sales_person
end
