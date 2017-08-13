class UserController < ApplicationController
	before_action :set_user, only: [:show, :update, :destroy]

	# GET /users
	def index
		@user = User.all
		json_response(@user)

	end

	def login
		@userL = User.new()
		@userL.token = Random.new_seed
		@userL.save
		params.permit(:name, :password, :token)
		@userL = User.where("name" => params[:name], "password" =>params[:password])
		json_response(@userL[0])
	end
	# POST /users
	def create	
		params.permit(:name, :password, :token)
		@user = User.new()
		@user.name = params[:name]
		@user.password = params[:password]
		@user.token = Random.new_seed
		@user.save
		json_response(@user, :created)
	end

	# GET /users/:id
	def show
		json_response(@user)
	end

	# PUT /users/:id
	def update
		@user.update(user_params)
		head :no_content
	end

	# DELETE /users/:id
	def destroy
		@user.destroy
		head :no_content
	end

  private

  def user_params
    # whitelist params
    params.permit(:name, :password, :token)
  end


	def set_user
		@user = User.find(params[:id])
	end
end
