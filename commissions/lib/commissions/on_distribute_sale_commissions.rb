module Commissions
  class OnDistributeSaleCommissions
    include CommandHandler
    def call(command)
      with_aggregate(CommissionRoot, command.aggregate_id) do |commission|
        commission.distribute_commissions(command.sale_id)
      end
    end
  end
end
