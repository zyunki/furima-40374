class ShippingOrigin < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :order
end
