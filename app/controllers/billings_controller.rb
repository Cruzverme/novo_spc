# frozen_string_literal: true

class BillingsController < ApplicationController
  def new
    @costumer = Costumer.find_by_id(params[:costumer])
    @billing = GetBillingCostumerService.new(@costumer.contract_number).perform
  end

  def create
    
  end

  def destroy; end

  def update; end
end
