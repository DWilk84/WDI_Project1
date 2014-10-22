class AdmissionsController < ApplicationController
  def new
    @admission = Admission.new()
  end

  def create
    @admission = Admission.new(params[:admission])
    @admission.user_id = current_user.id
    @admission.status = "pending"
    @admission.save
    redirect_to courses_path, notice: 'Application submitted.' 
  end

  def destroy
  end
end
