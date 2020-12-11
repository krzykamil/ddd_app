module Commissions
  class DistributeSaleCommissions < Command
    attribute :sale_id, Types::ID
    alias :aggregate_id :sale_id
  end
end
