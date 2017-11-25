from flask import Flask, request, render_template, url_for
import json
import pydub
import string
import random
import os

app = Flask(__name__)

@app.route("/")
def main():
    return render_template('main.html')

@app.route("/audio/<audio_id>")
def play(audio_id):
    return render_template('index.html')

@app.route("/mixaudio", methods=["POST"])
def mix_audio():
    # pydub.AudioSegment.converter = "D:/advanced_files/ffmpeg/bin/ffmpeg.exe"
    pydub.AudioSegment.converter = "/usr/bin/ffmpeg"

    # 파라미터로 받아야하는 것
    # 오디오 콘텐츠 url
    audio_content_url = "../audio_section_rails_api/public/audio_sample/" + request.get_json()['audio_filename']
    # 녹음본 url
    record_url = "../audio_section_rails_api/public/record/" + request.get_json()['record_filename']
    # 시작구간
    clip_start_time = request.get_json()['clip_start_time']
    # 끝구간
    clip_end_time = request.get_json()['clip_end_time']

    # sound1가 오디오 콘텐츠
    sound1 = pydub.AudioSegment.from_file(audio_content_url, "mp4")
    # sound2가 녹음본
    sound2 = pydub.AudioSegment.from_wav(record_url)

    #겹친다
    output = sound1[int(clip_start_time):int(clip_end_time)].overlay(sound2)


    # 믹스된 것 이름
    mixed_content_name = ''.join(random.choices(string.ascii_uppercase + string.digits, k=5))
    output.export("../audio_section_rails_api/public/mixaudio/"+mixed_content_name + ".mp3", format="mp3")

    print("여기까지?3")
    # 리턴해야 하는 것
    # mix된것 url
    response = {
        "mixed_content_name": mixed_content_name,
        "mixed_content_url": mixed_content_name + ".mp3"
    }
    return(json.dumps(response))


if (__name__ == "__main__"):
    app.run(debug=True, host='0.0.0.0', port=5009)
