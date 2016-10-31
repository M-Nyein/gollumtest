class ApiController < ApplicationController

	http_basic_authenticate_with :name => "user", :password => "password"
	  
	def all_user_list
		users = Array.new
		User.all.each do |f|
			users<< UserSerializer.new(User.find(f.id))
		end
		render json: users
		# @users = User.all.to_json
	    # render json: @users
	end
	def user_list_by_division
		#all user list ordered by division
		# @users = User.all.order('division_id').to_json

		@users = Division.find(params[:division_id]).users.to_json

	    render json: @users
	end
	def user_list_by_town
		@users = Town.find(params[:town_id]).users.to_json
	    render json: @users
	end

	def all_division_list
		# @divisions = Division.all.to_json
	 #    render json: @divisions
	 name = Array.new
		Division.all.each do |f|
			name<< DivisionSerializer.new(Division.find(f))
		end
		render json: name
	end

	def all_town_list
		# @towns = Town.all.to_json
	 #    render json: @towns
	 name = Array.new
		Town.all.each do |f|
			name<< TownSerializer.new(Town.find(f))
		end
		render json: name
	end
	def town_list_by_division
		@towns = Division.find(params[:Division]).towns.to_json
	    render json: @towns
	end

	#for basic authentication
	# before_filter :authenticate

	# protected

	# def authenticate
	#   authenticate_or_request_with_http_basic do |username, password|
	#     username == "foo" && password == "bar"
	#   end
	# end
end
