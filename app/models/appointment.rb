include ActiveModel::Validations
class Appointment < ApplicationRecord
  
  belongs_to :doctor
  belongs_to :patient
  
  validates_with MyValidator


  
end

class MyValidator < ActiveModel::Validator
  def validate(appointment)
    # no more than 3 max
    appointment.errors[:quantity] << 'Appointment limit reached' if Appointment.where(datetime: appointment.datetime).count > 2
    
    # assuming that the date comes in as a datetime, extract secs and mins, make sure that secs == 0 and mins % 15 == 0
    # I know that JS datetimes are different than ruby datetimes, so there might be a some trouble here 
    # would probably be easier if i had a datetime object to look at
    # probably some string manipulation about pulling the seconds and mins would go here. or some more official datetime libraries
    # Or, who knows? theres probably(definately) a better method of doing it than using datetime, and ive done all this work for nothing.
    appointment.errors[:datetime] << 'Time needs to be in 15 min intervals' if appointment.datetime.
  end
end