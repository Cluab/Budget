class ExchangesController < ApplicationController
  before_action :set_exchange, only: %i[ show edit update destroy ]

  # GET /exchanges or /exchanges.json
  def index
    @exchanges = Exchange.all
  end

  # GET /exchanges/1 or /exchanges/1.json
  def show
  end

  # GET /exchanges/new
  def new
    @exchange = Exchange.new
  end

  # GET /exchanges/1/edit
  def edit
  end

  # POST /exchanges or /exchanges.json
  def create
    @exchange = Exchange.new(exchange_params)

    respond_to do |format|
      if @exchange.save
        format.html { redirect_to exchange_url(@exchange), notice: "Exchange was successfully created." }
        format.json { render :show, status: :created, location: @exchange }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exchange.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exchanges/1 or /exchanges/1.json
  def update
    respond_to do |format|
      if @exchange.update(exchange_params)
        format.html { redirect_to exchange_url(@exchange), notice: "Exchange was successfully updated." }
        format.json { render :show, status: :ok, location: @exchange }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exchange.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exchanges/1 or /exchanges/1.json
  def destroy
    @exchange.destroy

    respond_to do |format|
      format.html { redirect_to exchanges_url, notice: "Exchange was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exchange
      @exchange = Exchange.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exchange_params
      params.require(:exchange).permit(:name, :amount, :user_id, :Group_id)
    end
end
