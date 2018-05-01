class Address < ApplicationRecord

  belongs_to :user

  validates :first_name,
    :last_name,
    :city,
    :state,
    :pincode,
    presence: true

end
