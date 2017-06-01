class CommentsController < ApplicationController

	before_action :authenticate_user!

	def create
		@place = Place.find(params[:place_id])
		@place.comments.create(comment_params.merge(user: current_user))

=begin
# alternative 1
Comment.create(comment_params.merge( :user => current_user, :place_id => params[:id] )
# alternative 2
@place.comments.new(comment_params)
@place.user = current_user
@place.save
=end

		redirect_to place_path(@place)
	end

	private

	def comment_params
		params.require(:comment).permit(:message, :rating)
	end

end
