# 플라스크 서버와 통신하는 클래스
class FlaskConnect

  # 오디오를 mix하는 메서드
  # mixaudio의 filename을 return
  def mix_audio(audio_filename, record_filename, start_time, end_time)
    # @flask_url = "http://210.89.181.131:5009/mixaudio"
    @flask_url = "http://localhost:5009/mixaudio"
    @response = HTTParty.post(@flask_url,
                            :body => { "audio_filename" => audio_filename,
                                       "record_filename" => record_filename,
                                       "clip_start_time" => start_time,
                                       "clip_end_time" => end_time
                            }.to_json,
                            :headers => { 'Content-Type' => 'application/json' } )

    return @response.body
  end
end