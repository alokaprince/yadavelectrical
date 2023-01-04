
class DealerbillsController < ApplicationController
  before_action :set_dealerbill, only: %i[ show edit update destroy ]

  # GET /dealerbills or /dealerbills.json
  def index
    @dealerbills = Dealerbill.all
  end

  # GET /dealerbills/1 or /dealerbills/1.json
  def show
    @dealer = Dealer.find(@dealerbill.dealer_id)
    @stocks = Stock.all
  end

  # GET /dealerbills/new
  def new
    @dealerbill = Dealerbill.new
  end

  def print4
    id = request.path.split('.').last
    @dealerbill = Dealerbill.find(id)
    render :layout => false
  end  

  # GET /dealerbills/1/edit
  def edit
    @dealer = Dealer.find(@dealerbill.dealer_id)
  end

  # POST /dealerbills or /dealerbills.json
  def create
    @dealer = Dealer.find(params[:dealer_id])
    @dealerbill = @dealer.dealerbills.create(dealerbill_params)

    respond_to do |format|
      if @dealerbill.save
        format.html { redirect_to @dealerbill, notice: "Dealerbill was successfully created." }
        format.json { render :show, status: :created, location: @dealerbill }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dealerbill.errors, status: :unprocessable_entity }
      end
    end
    sum = 0
    rec = 0
    bal = 0
    
    @dealer.dealerbills.each do |bill|
      sum = (sum + bill.credit)
      rec = ( rec + bill.debit) 
      bal = sum - rec
    end

    @dealer.update(total:sum,recieve:rec,balance:bal)
  end

  # PATCH/PUT /dealerbills/1 or /dealerbills/1.json
  def update
    @dealerbill = Dealerbill.find(params[:id])
    cust = @dealerbill.dealer_id
    respond_to do |format|
      if @dealerbill.update(dealerbill_params)
        format.html { redirect_to @dealerbill, notice: "Dealerbill was successfully updated." }
        format.json { render :show, status: :ok, location: @dealerbill }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dealerbill.errors, status: :unprocessable_entity }
      end
    end
    @dealer = Dealer.find(cust)
    sum = 0
    rec = 0
    bal = 0
    
    @dealer.dealerbills.each do |bill|
      sum = (sum + bill.credit)
      rec = ( rec + bill.debit) 
      bal = sum - rec
    end

    @dealer.update(total:sum,recieve:rec,balance:bal)
  end

  def pay2
    @parameter = params[:pay]
    puts (@parameter)
    id = params[:id]
    @dealerbill = Dealerbill.find(id)
    
    credit = @dealerbill.credit
    debit = @dealerbill.debit
    
    billamt = 0
    @dealerbill.dealeritems.each do |item|
      billamt = (item.amount) 
    end
    
    paidamt = Float(@parameter)
    puts (paidamt)
    if debit == 0
      cred = billamt
      deb = paidamt
      @dealerbill.update(credit:cred, debit:deb)
    else
      deb  = debit + paidamt 
      @dealerbill.update(debit:deb)
    end
  
    sum = 0
    rec = 0
    bal = 0
    cust = @dealerbill.dealer_id
    @dealer = Dealer.find(cust)
    
    @dealer.dealerbills.each do |bill|
      sum = (sum + bill.credit)
      rec = ( rec + bill.debit) 
      bal = sum - rec
    end

    @dealer.update(total:sum,recieve:rec,balance:bal)
    redirect_to @dealerbill
  end

  def credit2
    credit = params[:credit]
    debit = params[:debit]
    remark = params[:remark]
    
    id = params[:id]
    @dealerbill = Dealerbill.find(id)
    @dealerbill.update(credit:credit,debit:debit,remark:remark)

    sum = 0
    rec = 0
    bal = 0
    cust = @dealerbill.dealer_id
    @dealer = Dealer.find(cust)
    
    @dealer.dealerbills.each do |bill|
      sum = (sum + bill.credit)
      rec = ( rec + bill.debit) 
      bal = sum - rec
    end

    @dealer.update(total:sum,recieve:rec,balance:bal)
    redirect_to @dealerbill
  end

  # DELETE /dealerbills/1 or /dealerbills/1.json
  def destroy
    @dealerbill = Dealerbill.find(params[:id])
    cust = @dealerbill.dealer_id
    @dealerbill.destroy
    @dealer = Dealer.find(cust)
    sum = 0
    rec = 0
    bal = 0
    
    @dealer.dealerbills.each do |bill|
      sum = (sum + bill.credit)
      rec = ( rec + bill.debit) 
      bal = sum - rec
    end
    @dealer.update(total:sum,recieve:rec,balance:bal)
    respond_to do |format|
      format.html { redirect_to dealer_path(cust), notice: "Dealerbill was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dealerbill
      @dealerbill = Dealerbill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dealerbill_params
      params.require(:dealerbill).permit(:billno, :date, :credit, :debit, :remark, :dealer_id)
    end
end
