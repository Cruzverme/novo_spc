class Billing < ApplicationRecord
  belongs_to :costumer, class_name: "Costumer", optional: true
end
