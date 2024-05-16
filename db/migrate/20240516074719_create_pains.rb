class CreatePains < ActiveRecord::Migration[7.0]
  def change
    create_table :pains do |t|
      t.references  :user,           null: false, foreign_key: true
      t.integer     :pain_scale_id,  null: false
      t.text        :treatment
      t.text        :evaluation
      t.text        :memo
      t.datetime    :time,           null: false
      t.timestamps
    end
  end
end
