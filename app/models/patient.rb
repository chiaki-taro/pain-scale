class Patient < ApplicationRecord
  belongs_to :user
  has_many :pains

  with_options presence: true do
    validates :patient_name
  end
end
