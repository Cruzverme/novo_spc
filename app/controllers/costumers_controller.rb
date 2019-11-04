class CostumersController < ApplicationController
  ## ANTES DESTAS ACTIONS IRÁ TER O METODO SET COSTUMER PARA PEGAR O COSTUMER
  before_action :set_costumer, only: [:show, :edit, :update, :destroy]

  def index
    @costumers = Costumer.all.order('status_spc')
  end

  def show
  end

  def create
    @costumer = Costumer.new(costumer_params)

    respond_to do |format|
      if(@costumer.save)
        format.html { redirect_to "/costumers", flash: { success: 'Costumer was successfully created.'}}
        format.json { render "/costumers", status: :created, location: @costumer }
      else
        format.html { render :new}
        format.json { render json: @costumer.erros, status: :unprocessable_entity }
      end
    end
  end

  def update; end

  def costumer_informations
    informacoes = GetClientesErpService.new(params[:contract]).perform
    render json: {"informacoes": informacoes}
  end

  def destroy
    @costumer.destroy
    respond_to do |format|
      format.html { redirect_to '/costumers', flash: { success: 'Costumer was successfully destroyed.' }}
      format.json { head :no_content }
    end
  end

  private 
    def set_costumer
      @costumer = Costumer.find(params[:id])
    end
    def costumer_params
      params.permit(:name,:street,:streetNo,:contract_number,:status_spc)
    end
end
