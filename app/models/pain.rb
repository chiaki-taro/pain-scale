class Pain < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :scale
  belongs_to :patient

  validates :pain_scale_id, numericality: { other_than: 0, message: "can't be blank" }

  with_options presence: true do
    validates :pain_scale_id
    validates :time
  end
end
