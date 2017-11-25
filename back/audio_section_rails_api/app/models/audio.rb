class Audio < ApplicationRecord
  has_many :clips
  mount_uploader :clip_url, MixaudioUploader
end
