class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_event, only: %i[show edit update destroy ]
  skip_after_action :verify_policy_scoped, only: [:index]

  # GET /events or /events.json
  def index
    if params[:search].present? 
      @pagy, @events = pagy(Event.search_by_description_and_name(params[:search]))
    elsif params[:sport].present?
      @pagy, @events = pagy(Event.joins(:sport).where(sports: { name: params[:sport] }))
    else
      @pagy, @events = pagy(Event.sort_by_params(params[:sort], sort_direction))
    end
    @events.load
  end

  # GET /events/1 or /events/1.json
  def show
    authorize @event
  end

  # GET /events/new
  def new
    @event = Event.new
    @club = Club.find(params[:club]) if params[:club].present?
    
    
    authorize @event
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.organizer = current_user
    
    authorize @event

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
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
      params.require(:event).permit(:name, :address,:club_id,  :city, :postal_code, :website, :image_url, :start_date, :end_date, :sport_id)
    end
end
