class Patient < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :patient_name
  end
end
