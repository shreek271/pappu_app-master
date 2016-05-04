class CustomersController < ApplicationController

  before_action :logged_in_customer, only: [:edit, :update]
  before_action :correct_customer,   only: [:edit, :update]
  before_action :admin_customer,     only: [:index, :destroy] 
  
  def index
    @customers = Customer.paginate(page: params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      log_in @customer
      flash[:success] = "Registered successfully"
      redirect_to @customer
    else
      render 'new'
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
     @customer = Customer.find(params[:id])
     if @customer.update_attributes(customer_params)
      flash[:success] = "profile updated"
      redirect_to @customer
    else
      render 'edit'
    end
  end

  def delete
  end

  def destroy
    Customer.find(params[:id]).destroy
    flash[:success] = "Customer deleted"
    redirect_to customers_url
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :phone, 
                                    :password, :password_confirmation)
  end

  # Confirms a logged-in customer.
    def logged_in_customer
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct customer.
    def correct_customer
      @customer = Customer.find(params[:id])
      redirect_to(root_url) unless current_customer?(@customer)
    end

    # Confirms an admin user.
    def admin_customer
      redirect_to(root_url) unless current_customer.admin?
    end
end
