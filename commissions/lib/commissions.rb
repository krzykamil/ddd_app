# Bounded Context

module Commissions
end

require_dependency 'commissions/distribute_sale_commissions' #command
require_dependency 'commissions/on_distribute_sale_commissions' #command handler
require_dependency 'commissions/commission_root' #aggregate root
require_dependency 'commissions/commissions_applied' #event
