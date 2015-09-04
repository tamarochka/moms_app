class BabiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @babies = Baby.all
    @paychecks = Paycheck.all
  end

  def new
    @baby = Baby.new
  end

  def create
    @baby = Baby.new(baby_params)
    @baby.user_id = current_user.id
    if @baby.save
      flash[:notice] = "You successfully added " + @baby.first_name
      redirect_to babies_path
    else
       flash.now[:notice] = "There were problems with your request!"
       render :new
    end
  end

  def baby_params
    params.require(:baby).permit(:id, :first_name, :dob)
  end


end
