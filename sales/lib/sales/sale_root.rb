  require 'aggregate_root'

module Sales
  class SaleRoot
    include AggregateRoot

    NotInStock = Class.new(StandardError)
    NoAgreementWithCompany = Class.new(StandardError)


    def initialize(id)
      @id = id
      @state = "in_progress"
    end

    def make_sale(sale_id, quantity, product_id)
      raise NotInStock if product_quantity_not_enough?(product_id,quantity)
      raise NoAgreementWithCompany if no_agreement?(product_id, sale_id)
      apply SaleMade.new(data: { sale_id: sale_id, quantity: quantity, product_id: product_id })
    end

    on SaleMade do |event|
      @state = "sold"
    end

    private

    def no_agreement?(product_id, sale_id)
      # bad i know, thats not the point here though
      Agreement.find_by(
        owner: SalesPerson.find(Sales::Sale.find(sale_id)),
        company_id: Products::Product.find(product_id).company.id
      )
    end

    def product_quantity_not_enough?(product_id, quantity)
      Products::Product.find(product_id).quantity - quantity < 0
    end
  end
end
