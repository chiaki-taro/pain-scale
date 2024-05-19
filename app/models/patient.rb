class Patient < ApplicationRecord
  belongs_to :user
  has_many :pains, dependent: :destroy

  with_options presence: true do
    validates :patient_name
  end
end
