class CreatePitchDeckImages < ActiveRecord::Migration[6.1]
  def change
    create_table :pitch_deck_images do |t|
      t.string :filename
      t.belongs_to :company

      t.timestamps
    end
  end
end
