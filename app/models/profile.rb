class Profile < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name

  validates_presence_of :email
  validates_uniqueness_of :email

  validates_presence_of :phone_number
  validates_uniqueness_of :phone_number

  validates_presence_of :birth_date
end
