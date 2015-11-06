class Question < ActiveRecord::Base
  belongs_to :user

  def apply
    hoyaAPI = ENV["HOYA_API"]
    hoyaURL = "https://api.voicetext.jp/v1/tts"
    wavFile = "/tmp/voice.wav"
    text = self.message
    puts hoyaAPI
    puts text
    speaker = "hikari"
    emotion = "happiness"
    emotionLevel = 3
    pitch = 80
    speed = 120
    #curl "https://api.voicetext.jp/v1/tts" -o "wavファイル名"
    # -u "apiキー:" -d "text=変換したいテキスト"
    # -d "speaker=hikari" -d "emotion=happiness" -d "emotion_level=3" -d "pitch=80" -d "speed=120"

    c = Curl::Easy.new("https://api.voicetext.jp/v1/tts")
    c.http_auth_types = :basic
    c.username = hoyaAPI
    c.password = ''
    c.http_post(
    Curl::PostField.content('text', text),
      Curl::PostField.content('speaker', speaker),
      Curl::PostField.content('emotion', emotion),
      Curl::PostField.content('emotion_level', emotionLevel),
      Curl::PostField.content('pitch', pitch),
      Curl::PostField.content('speed', speed)
    )

    File.open(wavFile, 'wb') do |f|
      c.on_body {|data|f << data; data.size}
      c.perform
    end
  end
end
