class Agreement < ApplicationRecord
  belongs_to :owner, polymorphic: true
  belongs_to :company
end
