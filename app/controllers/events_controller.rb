class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /events
  # GET /events.json
  def index
    @events = Event.where(user_id: current_user.id)
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
 
  end

  # GET /events/1/edit
  def edit
  
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    respond_to do |format|
      if @event.save
        flash[:notice] = '予定を作成しました'
        format.html { redirect_to @event, notice: '予定を作成しました' }
        format.js   { render js: "window.location = '#{money_m_index_path}'" }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end

    @events = Event.where(user_id: current_user.id)
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    event = Event.find(params[:id])
    @events = Event.where(user_id: current_user.id)
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to "/money_m/index", notice: '予定を変更しました' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end


  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to "/money_m/index", notice: '予定を削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :description, :income, :expense, :start_date, :end_date)
    end
end
