class CreateMixaudios < ActiveRecord::Migration[5.1]
  def change
    create_table :mixaudios do |t|
      t.string :mixaudio_file_url
      t.string :clip_id

      t.timestamps
    end
  end
end
