class Costumer < ApplicationRecord
  
  has_many :billings, dependent: :destroy
end
