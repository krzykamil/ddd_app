require 'aggregate_root'

module Sales
  class SaleRoot
    include AggregateRoot

    def initialize(id)
      @id = id
      @state = "in_progress"
    end

    def make_sale(sale_id, quantity, product_id)
      # TODO: case of sale made on product that is not in stock
      # TODO: sale made before agreement is signed with sales guy
      apply SaleMade.new(data: { sale_id: sale_id, quantity: quantity, product_id: product_id })
    end

    on SaleMade do |event|
      @state = "sold"
    end
  end
end
