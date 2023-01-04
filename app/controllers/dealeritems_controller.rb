class DealeritemsController < ApplicationController
  before_action :set_dealeritem, only: %i[ show edit update destroy ]

  # GET /dealeritems or /dealeritems.json
  def index
    @dealeritems = Dealeritem.all
  end

  # GET /dealeritems/1 or /dealeritems/1.json
  def show
  end

  # GET /dealeritems/new
  def new
    @dealeritem = Dealeritem.new
  end

  # GET /dealeritems/1/edit
  def edit
  end

  # POST /dealeritems or /dealeritems.json
  def create
    @dealeritem = Dealeritem.new(dealeritem_params)

    respond_to do |format|
      if @dealeritem.save
        format.html { redirect_to @dealeritem, notice: "Dealeritem was successfully created." }
        format.json { render :show, status: :created, location: @dealeritem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dealeritem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dealeritems/1 or /dealeritems/1.json
  def update
    respond_to do |format|
      if @dealeritem.update(dealeritem_params)
        format.html { redirect_to @dealeritem, notice: "Dealeritem was successfully updated." }
        format.json { render :show, status: :ok, location: @dealeritem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dealeritem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dealeritems/1 or /dealeritems/1.json
  def destroy
    @dealeritem.destroy
    respond_to do |format|
      format.html { redirect_to dealeritems_url, notice: "Dealeritem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dealeritem
      @dealeritem = Dealeritem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dealeritem_params
      params.require(:dealeritem).permit(:itemname, :quantity, :rate, :unit, :amount, :dealerbill_id)
    end
end
