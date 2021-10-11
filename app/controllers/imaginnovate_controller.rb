class ImaginnovateController < ApplicationController
  def index
    @emp = Imaginnovate.with_deleted# + Imaginnovate.without_deleted 
    # deleted_at_records = Imaginnovate.where(:deleted_at.ne => nil)
    # @imag += deleted_at_records
    # @imag 
  end

  def show
     @emp = Imaginnovate.find(params[:id])
  end

  def new
     @emp = Imaginnovate.new
  end

  def create
    
    @emp = Imaginnovate.new(emp_params)
  
    # @imag.save

    # redirect_to root_path

    respond_to do |format|
      if @emp.save
        format.html { redirect_to root_path, notice: "Employees was successfully created." }
        format.json { render :show, status: :created, location: @emp }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @emp.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @emp = Imaginnovate.find(params[:id])

  end

  def update
     @emp = Imaginnovate.find(params[:id])
     @emp.update(emp_params)
     redirect_to root_path

  end

  def destroy
    # @imag = Imaginnovate.with_deleted.find(params[:id])
    @emp = Imaginnovate.with_deleted.find_by(id: params[:id])
    if @emp.present?
      @emp.really_destroy!
    end
    redirect_to root_path
 
  end
  def soft_delete_or_restore
    @emp = Imaginnovate.without_deleted.find_by(id:params[:id])
    if @emp.present?
      @emp.destroy
    else
      @emp = Imaginnovate.only_deleted.find_by(id: params[:id])
      @emp.restore
    end
    # @imag.restore
    redirect_to root_path
  end

  private 

  def emp_params 
    params.require(:imaginnovate).permit(:first_name, :last_name, :designation, :email)
  end



end
