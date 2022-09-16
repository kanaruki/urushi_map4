class Publics::PlacesController < ApplicationController
  skip_forgery_protection only: :create
  def create
    @group = Group.find(params[:place][:group_id])
    @place = Place.new(place_params)
    if @place.save
      redirect_to group_path(@group)
    else
      render "publics/groups/show"
    end
  end

  def show
    @place = Place.find(params[:id])
    @group = @place.group_id
  end
  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      redirect_to place_path(@place)
    else
      render :edit
    end
  end

  def destroy
    place = Place.find(params[:id])
    group = place.group_id
    place.destroy
    redirect_to group_path(group)
  end

  private
  def place_params
    params.require(:place).permit(:end_user_id, :group_id, :place_name,:address,:introduction,:latitude,:longitude,:image,:number)
  end
end
