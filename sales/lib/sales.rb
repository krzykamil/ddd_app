# Bounded Context

module Sales
end

require_dependency 'sales/make_sale' #command
require_dependency 'sales/on_sale_make' #command handler
require_dependency 'sales/sale_root' #aggregate root
require_dependency 'sales/sale_made' #event
