class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]

  # GET /customers or /customers.json
  def index
    @customers = Customer.order('name ASC').all
    @totalcustomer = Customer.count
  end

  # GET /customers/1 or /customers/1.json
  def show
    @customer = Customer.find(params[:id])
  end

  def print
    id = request.path.split('.').last
    @customer = Customer.find(id)
    render :layout => false
  end  

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  

  def update
    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)
      redirect_to customers_path , notice: "Customer was successfully updated."
    else
      render :edit
    end
  end

  def search  
    @parameter = params[:search].downcase
    @select  = params[:select]
    begin
    if params[:search].blank?
       redirect_to(root_path, notice: 'Search field is empty' ) and return
    else 
      if @select == 'name'
      @results = Customer.all.where("lower(name) LIKE :search", search: @parameter)
      end
      if @select == 'address'
      @results = Customer.all.where("lower(address) LIKE :search", search: @parameter)
      end
      if @select == 'block'
        @results = Customer.all.where("lower(block) LIKE :search", search: @parameter)
        end
    end 
    rescue ActiveRecord::RecordNotFound  
      redirect_to :controller => "customer", :action => "index", notice: "Please type valid Entry"
      return
   end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:name, :father, :address, :block, :mobile, :total, :recieve, :balance)
    end
end
