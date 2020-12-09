# frozen_string_literal: true

module Products
  class OnSaleMadeEvent
    def call(event)
      product = Products::Product.find(event.data[:product_id])
      product.update(quantity: product.quantity - event.data[:quantity])
    end
  end
end
