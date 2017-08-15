class BalancesController < InheritedResources::Base

  before_action :find_Balance, only: [  :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @balances = Balance.where(user_id: current_user).order('created_at DESC')

  end
  def history
        @balances = Balance.where(user_id: current_user).order('created_at DESC')
  end

  def show
#    if valid_page?
#   render template: "balances/#{params[:id]}"
 #else
#   render file: "public/404.html", status: :not_found
# end
  end

  def new
    @balance = current_user.balances.build
  end

  def create
    @balance = current_user.balances.build(balance_params)

    if @balance.save
      redirect_to @balance
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @balance.update(balance_params)

  redirect_to @Balance
else
  render 'edit'
end
  end

  def destroy
    @balance.destroy
  end




  private
  def find_Balance
    @balance = Balance.find(params[:id])
  end
  def valid_page?
     File.exist?(Pathname.new(Rails.root + "app/views/balances/#{params[:id]}.html.erb"))
   end
    def balance_params
      params.require(:balance).permit(:balance, :tradeId, :currency, :deposit, :expiration, :status, :tradetype, :entry, :rate, :return )
    end
end
