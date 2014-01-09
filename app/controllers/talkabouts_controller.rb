class TalkaboutsController < ApplicationController
  before_action :set_talkabout, only: [:show, :edit, :update, :destroy]

  # GET /talkabouts
  def index
    @talkabouts = Talkabout.all
  end

  # GET /talkabouts/1
  def show
  end

  # GET /talkabouts/new
  def new
    @talkabout = Talkabout.new
  end

  # GET /talkabouts/1/edit
  def edit
  end

  # POST /talkabouts
  def create
    @talkabout = Talkabout.new(talkabout_params)

    if @talkabout.save
      redirect_to @talkabout, notice: 'Talkabout was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /talkabouts/1
  def update
    if @talkabout.update(talkabout_params)
      redirect_to @talkabout, notice: 'Talkabout was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /talkabouts/1
  def destroy
    @talkabout.destroy
    redirect_to talkabouts_url, notice: 'Talkabout was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_talkabout
      @talkabout = Talkabout.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def talkabout_params
      params.require(:talkabout).permit(:content, :check)
    end
end
