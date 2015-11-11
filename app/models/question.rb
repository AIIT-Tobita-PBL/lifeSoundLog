class Question < ActiveRecord::Base
  belongs_to :user

  def apply
    hoyaAPI = ENV["HOYA_API"]
    hoyaURL = "https://api.voicetext.jp/v1/tts"
    wavFile = "/tmp/question.wav"
    text = self.message
    puts hoyaAPI
    puts text
    #speaker = "hikari"
    speaker = "bear"
    #emotion = "happiness"
    emotion = "anger"
    emotionLevel = 4
    pitch = 80
    speed = 120

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
