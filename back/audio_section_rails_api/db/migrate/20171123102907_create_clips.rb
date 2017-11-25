class CreateClips < ActiveRecord::Migration[5.1]
  def change
    create_table :clips do |t|
      t.string :audio_id
      t.string :clip_url

      t.timestamps
    end
  end
end
