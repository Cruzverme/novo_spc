class Costumer < ApplicationRecord

  has_many :billings, dependent: :destroy

  def self.checkPayment
    CheckPaymentBillingService.new.perform
  end
end