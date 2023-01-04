class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @bill = Bill.find(params[:bill_id])
    
    itemname = item_params['itemname']
    itemquantity = item_params['quantity']
    itemunit = item_params['unit']
    itemrate = item_params['rate']
    # idk = itemname.split('~')
    # value = idk[0]
    # id = Stock.find_by(prodname: value).id
    # puts (id)
    # @stock = Stock.find(id)
    # itemrate = @stock.price3

    amt = Float(itemquantity) * Float(itemrate)
    puts (amt)

   
    @item = @bill.items.create(itemname:itemname, quantity:itemquantity, rate:itemrate,unit:itemunit, amount:amt, bill_id:params[:bill_id])
    respond_to do |format|
      if @item.save
        format.html { redirect_to @bill, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
    sum1 = 0
    
    @bill.items.each do |item|
      sum1 = (sum1 + item.amount)
    end
    @bill.update(credit:sum1)

    sum = 0
    rec = 0
    bal = 0
    cust = @bill.customer_id
    @customer = Customer.find(cust)
    
    @customer.bills.each do |bill|
      sum = (sum + bill.credit)
      rec = ( rec + bill.debit) 
      bal = sum - rec
    end

    @customer.update(total:sum,recieve:rec,balance:bal)
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  

  # DELETE /items/1 or /items/1.json
  def destroy
    @item = Item.find(params[:id])
    bill = @item.bill_id
    @bill = Bill.find(bill)
    @item.destroy
    respond_to do |format|
      format.html { redirect_to @bill, notice: "item was successfully destroyed." }
      format.json { head :no_content }
    end

    sum1= 0
  
    @bill = Bill.find(bill)
    @bill.items.each do |item|
      sum1 = (sum1 + item.amount)
    end
    @bill.update(credit:sum1)

    cust = @bill.customer_id
    sum = 0
    rec = 0
    bal = 0
    @customer = Customer.find(cust)
    @customer.bills.each do |bill|
      sum = (sum + bill.credit)
      rec = ( rec + bill.debit) 
      bal = sum - rec
    end

     @customer.update(total:sum,recieve:rec,balance:bal)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:itemname, :quantity, :rate, :unit, :amount, :bill_id)
    end
end
