class AppointmentSerializer < ActiveModel::Serializer
  # TODO: datetime should be split into both date and time here
  attributes :id, :datetime, 
  # model association
  has_many :patients
end