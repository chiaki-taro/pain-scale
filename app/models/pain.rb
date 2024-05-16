class Pain < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :pain_scale_id
    validates :time
  end
end
