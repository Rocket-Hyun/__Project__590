# require 'FlaskConnect'

class ClipsController < ApplicationController
  # post 'audio/<audio_id>/clips'
  # post '/clips'
  def create_clip
    # 원본 콘텐츠의 id
    @audio_id = params[:audio_id]
    @audio_file_name = @audio_id + ".mp4"

    # 녹음 파일
    # 파일로 받을 때
    # print(params[:record_file])
    @record_file = params[:record_file]
    # URL로 받을 때
    # @record_file =

    # 녹음 파일 서버에 저장
    record_uploader = RecordUploader.new
    record_uploader.store!(@record_file)

    @record_file_name = record_uploader.filename

    # 구간 시작
    @section_start = params[:section_start]
    # 구간 끝
    @section_end = params[:section_end]

    # 플라스크와 통신
    # 리턴값 mix audio file url
    conn = FlaskConnect.new
    @response = JSON.parse(conn.mix_audio(@audio_file_name, @record_file_name, @section_start, @section_end))
    @mix_audio_url=  @response["mixed_content_url"]
    @mix_audio_name = @response["mixed_content_name"]
    print(@response["mixed_content_url"])
    print(@response["mixed_content_url"])

    #클립 저장
    @clip = Clip.new
    @clip.audio_id = @audio_id.to_i
    @clip.clip_url = @mix_audio_name
    @clip.save

    #Mixaudio 저장
    @mix_audio = Mixaudio.new
    @mix_audio.mixaudio_file_url = @mix_audio_name
    @mix_audio.clip_id = @clip.id
    @mix_audio.save

    @response_json = {
        clip_url: @mix_audio.mixaudio_file_url
    }

    render json: @response_json

  end

  # get '/audio/<audio_id>/clips/<clip_key_value>'
  def get_clip
    @clip_url = params[:clip_key_value]

    @clip = Clip.find_by(clip_url: @clip_url)

    render json: @clip
  end
end
