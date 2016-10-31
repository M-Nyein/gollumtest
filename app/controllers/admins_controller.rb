class AdminsController < ApplicationController

  def index
  	@admins = Admin.all
  end
  def show
  	@admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end
  def create
    # @admin = admin.find(params[:id])
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to admin_path
    else
      render 'new'
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end
  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(admin_params)
      redirect_to admins_path
    else
      render 'edit'
    end
  end


  private 
  def admin_params
  	params.require(:admin).permit(:name, :email, :password)
  end
end
