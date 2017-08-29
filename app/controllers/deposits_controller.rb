class DepositsController < InheritedResources::Base
  before_action :find_deposit, only: [  :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @deposits = Deposit.where(user_id: current_user).order('created_at DESC')

  end
  def show
  #    if valid_page?
  #   render template: "deposits/#{params[:id]}"
  #else
  #   render file: "public/404.html", status: :not_found
  # end
  end

  def new
    @deposit = current_user.deposits.build
  end

  def create
    @deposit = current_user.deposits.build(deposit_params)

    if @deposit.save
      UserDepositMailer.deposit_email(@user, @deposit).deliver
      redirect_to @deposit
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @deposit.update(deposit_params)

  redirect_to @deposit
  else
  render 'edit'
  end
  end

  def destroy
    @deposit.destroy
  end



  private
    def find_deposit
      @deposit = Deposit.find(params[:id])
    end
    def deposit_params
      params.require(:deposit).permit(:amount, :bitcoin_address)
    end
end
