class LikesctrlController < ApplicationController  
  before_filter :signed_in_user   #before all the below methods
  rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique
  def update
	@obj=Like.where({:micropost_id=> params[:id],:user_id=>current_user.id}).first
	@post=Micropost.where({:id=>params[:id]}).first
	if @obj.nil?
		@like=Like.new(:micropost_id=> params[:id],:user_id=>current_user.id,:like_or_unlike => "like")
		if @like.save
			@post.update_attribute(:num_likes,@post.num_likes+1)
			@post.save		
		else
			flash[:error] = "Error has occurred!"
    		end
	else
		
		if @obj.like_or_unlike=="like"  #already liked
			@obj.destroy
			@post.update_attribute(:num_likes,@post.num_likes-1)
			@post.save	
		elsif @obj.like_or_unlike=="unlike"
			@obj.update_attribute(:like_or_unlike,"like")
			@obj.save
			@post.update_attribute(:num_unlikes,@post.num_unlikes-1) 
			@post.update_attribute(:num_likes,@post.num_likes+1)
			@post.save
		end
		
	end
	redirect_to :back
  end

  
  def record_not_unique
	flash[:error] = "Already done!"
      	redirect_to :back
  end
end
