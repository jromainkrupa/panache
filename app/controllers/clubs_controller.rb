class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]
    
  def index
    @clubs = Club.all
  end
  
  def show
  end
  
  def new
    @club = current_user.clubs.new
  end

  def create
    @user    = current_user
    @user.update(is_club_admin: true)
    @club = Club.new(club_params)
    @club.admin = @user

    if @club.save
      redirect_to club_path(@club), notice: "Club was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @club.update(club_params)
      redirect_to club_path(@club), notice: "club was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @club.destroy
    redirect_to root_path, notice: "club was successfully destroyed."
  end


  private

  def set_club
    @club = Club.find(params[:id])

  end

  def club_params
    params.require(:club).permit(:name, :address, :city, :postal_code, :website, :image_url)
  end

end
end
