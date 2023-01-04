class DealersController < ApplicationController
  before_action :set_dealer, only: %i[ show edit update destroy ]

  # GET /dealers or /dealers.json
  def index
    @dealers = Dealer.all
    @dealers = Dealer.order('name ASC').all
    @totaldealer = Dealer.count
  end

  # GET /dealers/1 or /dealers/1.json
  def show
    @dealer = Dealer.find(params[:id])
  end

  def print3
    id = request.path.split('.').last
    @dealer = Dealer.find(id)
    render :layout => false
  end  

  # GET /dealers/new
  def new
    @dealer = Dealer.new
  end

  # GET /dealers/1/edit
  def edit
  end

  # POST /dealers or /dealers.json
  def create
    @dealer = Dealer.new(dealer_params)

    respond_to do |format|
      if @dealer.save
        format.html { redirect_to @dealer, notice: "Dealer was successfully created." }
        format.json { render :show, status: :created, location: @dealer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dealer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dealers/1 or /dealers/1.json
  def update
    respond_to do |format|
      if @dealer.update(dealer_params)
        format.html { redirect_to @dealer, notice: "Dealer was successfully updated." }
        format.json { render :show, status: :ok, location: @dealer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dealer.errors, status: :unprocessable_entity }
      end
    end
  end

  def dealersearch  
    @parameter = params[:search].downcase
    @select  = params[:select]
    begin
    if params[:search].blank?
       redirect_to(root_path, notice: 'Search field is empty' ) and return
    else 
      if @select == 'name'
      @results = Dealer.all.where("lower(name) LIKE :search", search: @parameter)
      end
      if @select == 'address'
      @results = Dealer.all.where("lower(address) LIKE :search", search: @parameter)
      end
    end 
    rescue ActiveRecord::RecordNotFound  
      redirect_to :controller => "dealer", :action => "index", notice: "Please type valid Entry"
      return
   end
  end


  # DELETE /dealers/1 or /dealers/1.json
  def destroy
    @dealer = Dealer.find(params[:id])
    @dealer.destroy
    respond_to do |format|
      format.html { redirect_to dealers_url, notice: "Dealer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dealer
      @dealer = Dealer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dealer_params
      params.require(:dealer).permit(:name, :address, :mobile, :total, :recieve, :balance)
    end
end
