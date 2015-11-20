class UploadersController < ApplicationController
  before_action :set_uploader, only: [:show, :edit, :update, :destroy]

  # GET /uploaders
  # GET /uploaders.json
  def index
    @uploaders = Uploader.all
  end

  # GET /uploaders/1
  # GET /uploaders/1.json
  def show
  end

  # GET /uploaders/new
  def new
    @uploader = Uploader.new
  end

  # GET /uploaders/1/edit
  def edit
  end

  # POST /uploaders
  # POST /uploaders.json
  def create
    userID = params[:id]
    user = User.find(userID)
    file = params[:wavFile]
    filepath = "uploads/#{userID}"
    #actualpath = "public/#{filepath}"
    actualpath = Rails.root.to_s + "/public/" + filepath
    #actualpath = "/home/tobby/tealion/lib/lifeSoundLog/public/" + filepath
    puts actualpath
    unless Dir.exist?(actualpath)
      Dir.mkdir(actualpath)
    end
    filename = DateTime.now.strftime("%Y%m%d_%H%M%S") + ".wav"
    puts filename

    uploadFlag = true
    begin
      File.open("#{actualpath}/#{filename}", 'wb') do |f|
        f.write(file.read)
      end
    rescue
      uploadFlag = false
    end

    @uploader = Uploader.new({
      filepath: filepath,
      filename: filename,
      user: user
    })
    if uploadFlag && @uploader.save
      render nothing: true, status: 200
    else
      render nothing: true, status: 5
      00
    end

  end

  # PATCH/PUT /uploaders/1
  # PATCH/PUT /uploaders/1.json
  def update
    respond_to do |format|
      if @uploader.update(uploader_params)
        format.html { redirect_to @uploader, notice: 'Uploader was successfully updated.' }
        format.json { render :show, status: :ok, location: @uploader }
      else
        format.html { render :edit }
        format.json { render json: @uploader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploaders/1
  # DELETE /uploaders/1.json
  def destroy
    wavFile = "public/#{@uploader.filepath}/#{@uploader.filename}"
    @uploader.destroy
    notice = 'Uploader was successfully destroyed.'
    begin
      File.delete(wavFile)
    rescue
      notice = "Deleting wav file #{wavFile} was failed"
    end
    respond_to do |format|
      format.html { redirect_to uploaders_url, notice: notice }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uploader
      @uploader = Uploader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uploader_params
      params.require(:uploader).permit(:filename, :filepath, :user_id)
    end
end
