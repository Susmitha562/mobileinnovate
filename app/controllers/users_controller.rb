class UsersController < ApplicationController
	def index
		@user = User.all
		# authorize User
		# @user = policy_scope(@user)

	end

	def new
		@user = user.new
	end
    # def  show
    # 	@user = User.find(params[:id])
    # 	puts @user.id
    # 	respond_to do |format|
    #     format.html
    #     format.js
    # end
    # end
	# def create
	#  @user = User.new(user_params)
 #     puts user_params.inspect
 #     if @user.valid?
 #       @user.save
 #      flash[:alert] ="user was saved successfully."
 #      redirect_to root_path
 #     else
 #      # render "index", :alert => 'Alert message!'
 #      # render html: "<script>alert('No users!')</script>".html_safe
 #     flash[:notice] = "Error When Creating User."
 #    end
 #   end	


	def admin
		true
	end

	private

	def user_params
		params.permit(:email, :password, :passwpord_confirmation)
	end
  
end
