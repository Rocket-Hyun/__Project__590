class Clip < ApplicationRecord
  belongs_to :audio
  has_one :mixaudio

end
