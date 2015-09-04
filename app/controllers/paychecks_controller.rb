class PaychecksController < ApplicationController
  before_action :authenticate_user!

  def new
    @paycheck = Paycheck.new
  end

  def create
    @paycheck = Paycheck.new(paycheck_params)
    if @paycheck.save
      flash[:notice] = "You successfully added new paycheck "
      redirect_to babies_path
    else
       flash.now[:notice] = "There were problems with your request!"
       render :new
    end
  end

  def paycheck_params
    params.require(:paycheck).permit(:start_date,:end_date, :hr_base, :hr_qty)
  end


end
