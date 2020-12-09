#frozen_string_literal: true
module Sales
  class SaleMade < Event
    attribute :sale_id, Types::ID
    attribute :product_id, Types::ID
    attribute :quantity, Types::Integer
  end
end
