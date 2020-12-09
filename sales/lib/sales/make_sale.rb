# frozen_string_literal: true

module Sales
  class MakeSale < Command
    attribute :sale_id, Types::ID
    attribute :product_id, Types::ID
    attribute :quantity, Types::Coercible::Integer
    alias :aggregate_id :sale_id
  end
end
