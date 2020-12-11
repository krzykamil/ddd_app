require 'aggregate_root'

module Commissions
  class CommissionRoot
    include AggregateRoot

    def initialize(id)
      @id = id
    end

    def distribute_commissions(sale_id)
      total = calculate_sale_total(sale_id)
      apply CommissionsApplied.new(
        data: {
          sale_id: sale_id,
          commission_sales_person: calculate_commission(sales_person_agreement.percentage, total),
          commission_platform: calculate_commission(platform_agreement.percentage, total)
        }
      )
    end

    on CommissionsApplied do |event|
      puts "handle"
    end

    private

    def calculate_commission(percentage, total)
      total.to_f * percentage / 100.to_f
    end

    def sales_person_agreement
      Agreement.find_by(owner: @sale.sales_person, company: company)
    end

    def platform_agreement
      Agreement.find_by(owner: platform, company: company)
    end

    def company
      @company ||= Company.find(@sale.company_id)
    end

    def platform
      #doing more for platform in terms of model and architecture seemed like an overkill for this lesson
      @platform ||= company.platform
    end

    def calculate_sale_total(sale_id)
      # Not getting total from model in case of race issue between events. This is why saga might have been a good idea.
      # A different solution is passing more data (not sale ID but sale info, so price of product and quantity, to avoid
      # the query). But this is the simplest in terms of implementation and fastest, the least code, and this challenge
      # is mostly about design and getting a better grip on the ideas themselves.
      sale(sale_id).quantity * Products::Product.find(@sale.product_id).price.to_f
    end

    def sale(sale_id)
      @sale ||= Sales::Sale.find(sale_id)
    end
  end
end
