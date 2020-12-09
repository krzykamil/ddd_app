# frozen_string_literal: true

module Sales
  class OnSaleMake
    include CommandHandler

    def call(command)
      with_aggregate(SaleRoot, command.aggregate_id) do |sale|
        sale.make_sale(command.sale_id, command.quantity, command.product_id)
      end
    end
  end
end
