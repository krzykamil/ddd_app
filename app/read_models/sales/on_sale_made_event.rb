# frozen_string_literal: true

module Sales
  class OnSaleMadeEvent
    def call(event)
      find_sale(event.data[:sale_id])
      find_product(event.data[:product_id])
      @sale.update(total: event.data[:quantity] * @product.price)
    end

    private

    def find_product(id)
      @product ||= Products::Product.find(id)
    end

    def find_sale(id)
      @sale ||= Sales::Sale.find(id)
    end
  end
end
