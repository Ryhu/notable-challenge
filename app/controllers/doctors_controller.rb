class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:appointments]
  def index
    @doctors = Doctor.all
    json_response(@doctors)
  end

  def appointments
    json_response(@doctor.appointments)
  end

  private

  def doctor_params
    # whitelist params
    params.permit(:first_name, :last_name)
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end
end