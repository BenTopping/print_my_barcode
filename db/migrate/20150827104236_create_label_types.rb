# frozen_string_literal: true

class CreateLabelTypes < ActiveRecord::Migration[4.2]
  def change
    create_table :label_types do |t|
      t.string :pitch_length
      t.string :print_width
      t.string :print_length
      t.string :feed_value
      t.string :fine_adjustment
      t.string :name

      t.timestamps null: false
    end
  end
end
