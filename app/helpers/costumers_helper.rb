# frozen_string_literal: true

module CostumersHelper
  def check_billing(costumer_billing)
    if costumer_billing != nil?
      'style = display:none
      disabled'
    end
  end

  def cor_de_pagamento(costumer_billing_status)
    if costumer_billing_status == 'N'
      'style= background-color:#AC3537'
    elsif costumer_billing_status == 'S'
      'style= background-color:#37AC35'
    end
  end
end
