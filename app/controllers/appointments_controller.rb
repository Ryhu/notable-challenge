class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :update, :destroy]

  # GET /appointments
  def index
    @appointment = Appointment.where(doctor_id: params[:id])
    @appointment = @appointment.filter {|appointment| appointment.datetime.to_date === params[:date]} 
    json_response(@appointment)
  end

  # POST /appointment
  def create
    # creating an appointment would also create a patient, or pull one from the db
    new_patient = 'patient'
    # patient needs an uniq identifier, ie social security / email
    # because time, patients will have to just...have the same first and last name. it's terrible
    @patient = Patient.find(first_name: appointment_params[:first_name], last_name: appointment_params[:last_name])

    if @patient
      @patient = Patient.create(first_name: appointment_params[:first_name], last_name: appointment_params[:last_name])
      new_patient = 'follow-up'
    end

    # make params more dynamic later
    @appointment = Appointment.create(datetime: appointment_params[:datetime], patient_id: @patient.id, doctor_id: params[:id], type: new_patient)

    json_response(@appointment, :created)
  end

  # DELETE /appointment/:id
  def destroy
    @appointment.destroy
    head :no_content
  end

  private

  def appointment_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_appointment
    @appointment = Appointments.find(params[:id])
  end
end