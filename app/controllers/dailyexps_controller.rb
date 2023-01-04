class DailyexpsController < ApplicationController
  before_action :set_dailyexp, only: %i[ show edit update destroy ]

  # GET /dailyexps or /dailyexps.json
  def index
    if params[:select].nil? 
    @dailyexps = Dailyexp.where("created_at >= ?", Time.zone.now.beginning_of_day)
    elsif
    @select = params[:select]
    day = Integer(@select)
    puts(day)
    if day == 0
      @dailyexps = Dailyexp.where("created_at >= ?", Time.zone.now.beginning_of_day)
    else
      @dailyexps = Dailyexp.where(:created_at=>day.days.ago..Date.current)
    end
    end
 end

  # GET /dailyexps/1 or /dailyexps/1.json
  def show
  end

  # GET /dailyexps/new
  def new
    @dailyexp = Dailyexp.new
  end

  # GET /dailyexps/1/edit
  def edit
  end

  # POST /dailyexps or /dailyexps.json
  def create
    @dailyexp = Dailyexp.new(dailyexp_params)

    respond_to do |format|
      if @dailyexp.save
        format.html { redirect_to @dailyexp, notice: "Dailyexp was successfully created." }
        format.json { render :show, status: :created, location: @dailyexp }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dailyexp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dailyexps/1 or /dailyexps/1.json
  def update
    respond_to do |format|
      if @dailyexp.update(dailyexp_params)
        format.html { redirect_to @dailyexp, notice: "Dailyexp was successfully updated." }
        format.json { render :show, status: :ok, location: @dailyexp }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dailyexp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dailyexps/1 or /dailyexps/1.json
  def destroy
    @dailyexp = Dailyexp.find(params[:id])
    @dailyexp.destroy
    redirect_to dailyexps_path,:notice =>"your expense has been deleted"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dailyexp
      @dailyexp = Dailyexp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dailyexp_params
      params.require(:dailyexp).permit(:name, :remark, :amount,:amount2)
    end
end
