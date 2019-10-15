class CostumersController < ApplicationController
  def show
  end

  def index
    @costumers = "AAAAAA"
  end

  def create
  end

  def update
  end

  def costumer_informations
    informacoes = GetClientesErpService.new(params[:contract]).perform
    render json: {"informacoes": informacoes}
  end

  def get_costumer_billing
    
  end

  def destroy
  end
end
