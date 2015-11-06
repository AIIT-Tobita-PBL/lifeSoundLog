#The script tp make named pipes if not exist

fifoDir = '/tmp'
files = ['questions.fifo']

files.each do |f|
  path = fifoDir + '/' + f
  unless File.exists?(path)
    cmd = "mkfifo #{path}"
    unless system(cmd)
      raise "failed to create named pipe #{path}"
    end
  end
end
