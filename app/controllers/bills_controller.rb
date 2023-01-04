class BillsController < ApplicationController
  before_action :set_bill, only: %i[ show edit update destroy ]

  # GET /bills or /bills.json
  def index
    
    if params[:select].nil? && (params[:from].nil?) && (params[:to].nil?)
    @bills = Bill.all
    @totalbill = @bills.count
    else
     if params[:select].present?
      @select = params[:select]
      day = Integer(@select)
      @bills = Bill.where(:date=>day.days.ago..Date.current)
      @totalbill = @bills.count
      if day == 0
        @bills = Bill.where(:date=>0.days.ago..Date.current)
        @totalbill = @bills.count
      else
        @bills = Bill.where(:date=>day.days.ago..Date.current)
        @totalbill = @bills.count
      end

     else
     from = params[:from]
     to = params[:to]
     @bills = Bill.where(:date => from..to)
     @totalbill = @bills.count
     end
    end
 end

  # GET /bills/1 or /bills/1.json
  def show
    @customer = Customer.find(@bill.customer_id)
    @stocks = Stock.all
  end

  # GET /bills/new
  def new
    @bill = Bill.new
  end
  def print2
    id = request.path.split('.').last
    @bill = Bill.find(id)
    render :layout => false
  end  

  # GET /bills/1/edit
  def edit
    @customer = Customer.find(@bill.customer_id)
  end

  # POST /bills or /bills.json
  def create
    @customer = Customer.find(params[:customer_id])
    @bill = @customer.bills.create(bill_params)
    respond_to do |format|
      if @customer.save
        format.html { redirect_to @bill, notice: "Bill was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html{redirect_to customer_path(@customer),notice: "Duplicate Bill was found"}
      end
    end
    
    sum = 0
    rec = 0
    bal = 0
    
    @customer.bills.each do |bill|
      sum = (sum + bill.credit)
      rec = ( rec + bill.debit) 
      bal = sum - rec
    end

    @customer.update(total:sum,recieve:rec,balance:bal)
  end

  def update
    @bill = Bill.find(params[:id])
    cust = @bill.customer_id

    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to customer_path(cust), notice: "Bill was successfully updated." }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
    @customer = Customer.find(cust)
    sum = 0
    rec = 0
    bal = 0
    
    @customer.bills.each do |bill|
      sum = (sum + bill.credit)
      rec = ( rec + bill.debit) 
      bal = sum - rec
    end

    @customer.update(total:sum,recieve:rec,balance:bal)
  end

  def pay1
    @parameter = params[:pay]
    puts (@parameter)
    id = params[:id]
    @bill = Bill.find(id)
    
    credit = @bill.credit
    debit = @bill.debit
    
    billamt = 0
    @bill.items.each do |item|
      billamt = (item.amount) 
    end
    
    paidamt = Float(@parameter)
    puts (paidamt)
    if debit == 0
      cred = billamt
      deb = paidamt
      @bill.update(credit:cred, debit:deb)
    else
      deb  = debit + paidamt 
      @bill.update(debit:deb)
    end
  
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
    redirect_to @bill
  end

  def credit
    credit = params[:credit]
    debit = params[:debit]
    remark = params[:remark]
    
    id = params[:id]
    @bill = Bill.find(id)
    @bill.update(credit:credit,debit:debit,remark:remark)

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
    redirect_to @bill
  end

  # DELETE /bills/1 or /bills/1.json
  def destroy
    @bill = Bill.find(params[:id])
    cust = @bill.customer_id
    @bill.destroy
    @customer = Customer.find(cust)
    sum = 0
    rec = 0
    bal = 0
    
    @customer.bills.each do |bill|
      sum = (sum + bill.credit)
      rec = ( rec + bill.debit) 
      bal = sum - rec
    end
    @customer.update(total:sum,recieve:rec,balance:bal)
    respond_to do |format|
      format.html { redirect_to customer_path(cust), notice: "Bill was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bill_params
      params.require(:bill).permit(:billno, :date, :credit, :debit, :remark, :customer_id)
    end
end
