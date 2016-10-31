class AdminusersController < ApplicationController
	# before_action :is_admin
  # before_action :authenticate_adminuser!
  # before_action :is_user

  def index
  	@adminusers = Adminuser.all
  end
  def show
  	@adminuser = Adminuser.find(params[:id])
  end

  def new
    @adminuser = Adminuser.new
  end
  def create
    # @admin = admin.find(params[:id])
    @adminuser = Adminuser.new(admin_params)
    if @adminuser.save
      redirect_to adminuser_path
    else
      render 'new'
    end
  end

  def edit
    @adminuser = Adminuser.find(params[:id])
  end
  def update
    @adminuser = Adminuser.find(params[:id])
    if @adminuser.update_attributes(admin_params)
      redirect_to adminuser_path
    else
      render 'edit'
    end
  end


  private 
  def admin_params
  	params.require(:adminuser).permit(:name, :email, :password)
  end


  def is_user
    if user_signed_in?
      destroy_user_session_path
      redirect_to adminuser_session_path
    end
  end
end
