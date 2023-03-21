class ExchangesController < ApplicationController
  before_action :authenticate_user!
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
    @group = Group.find(params[:group_id])
    @categories = Group.where(user_id: current_user.id)
  end

  # GET /exchanges/1/edit
  def edit
  end

  # POST /exchanges or /exchanges.json
  def create
    params = exchange_params
    @exchange = Exchange.new(name: params[:name], amount: params[:amount])
    @exchange.author = current_user
    @categories_ids = params[:group_ids]
    @categories_ids.each do |id|
      group = Group.find(id) unless id == ''
      @exchange.groups.push(group) unless group.nil?
    end

    respond_to do |format|
      if @exchange.save
        format.html { redirect_to groups_url, notice: 'Transaction was successfully created.' }
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
      params.require(:exchange).permit(:name, :amount, group_ids: [])
    end
end
