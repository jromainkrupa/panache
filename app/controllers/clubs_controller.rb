class ClubsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_club, only: %i[show edit update destroy ]
  skip_after_action :verify_policy_scoped, only: [:index]

  # GET /clubs or /clubs.json
  def index
    if params[:search].present? 
      @pagy, @clubs = pagy(Club.search_by_city_and_name(params[:search]))
    elsif params[:sport].present?
      @pagy, @clubs = pagy(Club.joins(:sport).where(sports: { name: params[:sport] }))
    else
      @pagy, @clubs = pagy(Club.sort_by_params(params[:sort], sort_direction))
    end
  end

  # GET /clubs/1 or /clubs/1.json
  def show
    authorize @club
    @events = @club.events
  end

  # GET /clubs/new
  def new
    @club = Club.new
    authorize @club
  end

  # GET /clubs/1/edit
  def edit
    authorize @club

  end

  # POST /clubs or /clubs.json
  def create
    @user    = current_user
    @user.update(is_club_admin: true)
    @club = Club.new(club_params)
    @sport = Sport.find(params[:club][:sport_id][0])
    @club.admin = @user
    
    authorize @club
    
    respond_to do |format|
      if @club.save
        @club_sport = ClubSport.create(sport: @sport, club: @club)
        format.html { redirect_to @club, notice: "Le club a été crée avec succès." }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clubs/1 or /clubs/1.json
  def update
    authorize @club

    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club, notice: "Le club a été correctement modifié." }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1 or /clubs/1.json
  def destroy
    authorize @club

    @club.destroy
    respond_to do |format|
      format.html { redirect_to clubs_url, notice: "Le club a été supprimé." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def club_params
      params.require(:club).permit(:name, :photo, :banner, :address, :description, :city, :postal_code, :website, :image_url, :mail, :siret, :phone_number,:facebook_url, :key_number, :number_key, :twitter_url, :instagram_url, sports: [])
    end
end
