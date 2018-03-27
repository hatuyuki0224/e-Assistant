class EventsController < ApplicationController
  before_action :authenticate_user, :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = set_current_user.events.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = set_current_user.events.build(event_params)
    respond_to do |format|
      format.html
      format.js
    end
 end

  # GET /events/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /events
  # POST /events.json
  def create
    @event = set_current_user.events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
        format.js
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        format.js { render :edit }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = set_current_user.events.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.fetch(:event, {}).permit(:title, :start, :end, :color, :allDay, :user_id)
    end
end
