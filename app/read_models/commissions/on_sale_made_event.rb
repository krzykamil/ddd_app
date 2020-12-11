# frozen_string_literal: true

module Commissions
  class OnSaleMadeEvent
    def call(event)
      Rails.configuration.command_bus.(Commissions::DistributeSaleCommissions.new(sale_id: event.data[:sale_id]))
    end
  end
end
