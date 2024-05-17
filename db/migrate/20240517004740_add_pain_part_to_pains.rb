class AddPainPartToPains < ActiveRecord::Migration[7.0]
  def change
    add_column :pains, :pain_part, :string
  end
end
