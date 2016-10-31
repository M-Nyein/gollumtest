class UsersController < ApplicationController
  

  before_filter :is_current_user, only: [:edit, :show]
  before_action :user_admin_sign_in #, except: [:show]
  # # before_filter :admin_only, except: [:show, :edit]

  before_filter :is_admin, only: [:index, :delete]
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  def create
    # @user = User.find(params[:id])
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end
  # def update
  #   @user = User.find(params[:id])
  #   if @user.save
  #     redirect_to user_path
  #   else
  #     render 'edit'
  #   end
  # end

  private 
  # def admin_only
  #   unless current_user.admin?
  #     redirect_to :back, :alert => "Access Denied"
  #   end
  # end

   
  def user_params
  	params.require(:user).permit(:name,:role, :email, :password, :current_password, :phone, :photo, :town_id, :division_id)
  end

  def is_admin
    unless adminuser_signed_in?
      flash[:notice] = 'Access denied'
      redirect_to user_path(current_user.id)
    end
  end

    def user_admin_sign_in
      unless current_user || adminuser_signed_in?
        redirect_to user_session_path
      end
      # unless user_signed_in? || adminuser_signed_in?
      #   redirect_to user_session_path
      # end
    end


    def is_current_user
        unless adminuser_signed_in?
          unless current_user == User.find(params[:id])
            flash[:notice] = 'Access denied'
            redirect_to user_path
          end
        end
    end

    # def job_owner
    #  unless @job.user_id == current_user.id
    #   flash[:notice] = 'Access denied as you are not owner of this Job'
    #   redirect_to jobs_path
    #  end
    # end
end
