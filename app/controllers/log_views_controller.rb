class LogViewsController < ApplicationController
  before_action :set_log_view, only: [:show, :edit, :update, :destroy]

  # GET /log_views
  # GET /log_views.json
  def index
    @log_views = LogView.all
  end

  # GET /log_views/1
  # GET /log_views/1.json
  def show
  end

  # GET /log_views/new
  def new
    @log_view = LogView.new
  end

  # GET /log_views/1/edit
  def edit
  end

  # POST /log_views
  # POST /log_views.json
  def create
    @log_view = LogView.new(log_view_params)

    respond_to do |format|
      if @log_view.save
        format.html { redirect_to @log_view, notice: 'Log view was successfully created.' }
        format.json { render :show, status: :created, location: @log_view }
      else
        format.html { render :new }
        format.json { render json: @log_view.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /log_views/1
  # PATCH/PUT /log_views/1.json
  def update
    respond_to do |format|
      if @log_view.update(log_view_params)
        format.html { redirect_to @log_view, notice: 'Log view was successfully updated.' }
        format.json { render :show, status: :ok, location: @log_view }
      else
        format.html { render :edit }
        format.json { render json: @log_view.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /log_views/1
  # DELETE /log_views/1.json
  def destroy
    @log_view.destroy
    respond_to do |format|
      format.html { redirect_to log_views_url, notice: 'Log view was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log_view
      @log_view = LogView.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_view_params
      params.require(:log_view).permit(:user_id, :msg)
    end
end
