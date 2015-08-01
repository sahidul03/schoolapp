class CommitteesController < ApplicationController

  def index
    @committees=Committee.all
    render layout: 'admin_layout'
  end

  def new
    @committee=Committee.new
    render layout: 'admin_layout'
  end

  def show
    @committee=Committee.find(params[:id])
    render layout: 'admin_layout'
  end

  def create
    @committee=Committee.new(params_committee)
    # raise params_student.inspect
    if @committee.save
      flash[:notice] = "Committee Member Added successfully."
      redirect_to committees_path
    else
      flash[:alert] = "Name can't be blank and choose a valid profile photo."
      redirect_to new_committee_path
    end
  end

  def edit
    @committee=Committee.find(params[:id])
    render layout: 'admin_layout'
  end

  def update
    @committee=Committee.find(params[:id])
    # raise params_student.inspect
    if @committee.update(params_committee)
      flash[:notice] = "Committee Member's information Updated successfully."
      redirect_to committees_path
    else
      flash[:alert] = "Please name insert and choose profile photo correctly."
      redirect_to edit_committee_path(@committee)
    end
  end

  def destroy
    @committee=Committee.find(params[:id])
    @committee.destroy
    flash[:alert] = "Committee Member deleted successfully."
    redirect_to committees_path
  end

  protected

  def params_committee
    params.require(:committee).permit(:name,:email, :phone, :message, :designation, :address,:profile_photo,:gender,:birth_day)
  end

end
