module Commissions
  class CommissionsApplied < Event
    attribute :sale_id, Types::ID
    attribute :commission_sales_person, Types::Float
    attribute :commission_platform, Types::Float
  end
end
