class UsersController < ApplicationController

	def index
		@users = User.all.with_attached_avatar
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(users_params)
		if @user.save
     		 redirect_to @user
   		else
    		render :new, status: :unprocessable_entity
    	end
	end

	def edit
		@user = User.find(params[:id])
	end
	

	def update
		@user = User.find(params[:id])

		if @user.update(users_params)
			redirect_to @user
		else
			render :edit, status: :unprocessable_entity
		end
	end
	

	def destroy
		byebug
		@user = User.find(params[:id])
		@user.destroy

		redirect_to root_path, status: :see_other
	end
	

	private

	def users_params
		params.require(:user).permit(:name, :body, :avatar)
	end

end
