class Publics::PlacesController < ApplicationController
  def create
    @group = Group.find(params[:place][:group_id])
    @place = Place.new(place_params)
    @place.save
    redirect_to group_path(@group)
  end

  private
  def place_params
    params.require(:place).permit(:end_user_id, :group_id, :place_name,:address,:introduction,:latitude,:longitude)
  end
end
