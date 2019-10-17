# frozen_string_literal: true

class BillingsController < ApplicationController
  before_action :set_billing, only: %i[show update destroy]

  def new
    @costumer = Costumer.find_by_id(params[:costumer])
    @billing = GetBillingCostumerService.new(@costumer.contract_number).perform
  end

  def create
    @billing = Billing.new(billing_params)

    respond_to do |format|
      if @billing.save
        format.html { redirect_to '/costumers', flash: {success: "Boleto #{@billing.number_titulo}  was successfully created."} }
        format.json { render '/costumers', status: :created, location: @billing }
      else
        format.html { render :new }
        format.json { render json: @billing.erros, status: :unprocessable_entity }
      end
    end
  end

  def destroy; end

  def update; end

  private

  def set_billing
    @billing = Billing.find(params[:id])
  end

  def billing_params
    params.permit(
      :number_titulo,
      :expiration_date,
      :status_pago,
      :value,
      :status_billing,
      :costumer_id
                  )
  end
end
