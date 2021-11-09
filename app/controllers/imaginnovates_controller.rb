class ImaginnovatesController < ApplicationController
  # after_action :verify_authorized, except: :index
  # after_action :verify_policy_scoped, only: :index
  respond_to :html, :xml, :json
  def index
    @emp = Imaginnovate.with_deleted
  end

  def show
     @emp = Imaginnovate.find(params[:id])
     # @user = User.find(params[:id])
  end

  def new
     @emp = Imaginnovate.new 
  end

  def create
     @emp = Imaginnovate.new(emp_params)
     puts emp_params.inspect
    if @emp.valid?
       @emp.save
      flash[:alert] ="Employee was saved successfully."
      redirect_to root_path
    else
      # render "index", :alert => 'Alert message!'
      # render html: "<script>alert('No users!')</script>".html_safe
     flash[:notice] = "Error When Creating Employee."
    end
  end

  def edit
    @emp = Imaginnovate.find(params[:id])
    # Userinnovate.edit_email(@emp).deliver_now

  end

  def update
     @emp = Imaginnovate.find(params[:id])
     # authorize @emp
     @emp.update(emp_params)
     redirect_to root_path

  end

  def destroy
    # @imag = Imaginnovate.with_deleted.find(params[:id])
    @emp = Imaginnovate.with_deleted.find_by(id: params[:id])
    if @emp.present?
       @emp.really_destroy!
       Userinnovate.destroy_email(@emp).deliver_now
       
    end
    redirect_to root_path
  end

  def soft_delete_or_restore
    @emp = Imaginnovate.without_deleted.find_by(id:params[:id])
    if @emp.present?
       @emp.destroy
       Userinnovate.delete_email(@emp).deliver_now
    else
      @emp = Imaginnovate.only_deleted.find_by(id: params[:id])
      @emp.restore
      Userinnovate.restore_email(@emp).deliver_now
    end
    # @imag.restore
    redirect_to root_path
  end

  private 

  def emp_params 
    params.require(:imaginnovate).permit(:first_name, :last_name, :designation, :email, :user_id)
  end



end
