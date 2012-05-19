class CannedmessagesController < ApplicationController
	def cancel_message
		uid = params['id']
		msg = Message.where(:facebook_id => uid)
		render :text => msg.destroy
	end
	
	def new
	   @cannedmessage = Cannedmessage.new
	   @graph = Koala::Facebook::API.new(@oauth_token)
     @profile = @graph.get_object("me")
     @user_id = @profile["id"]
	end
	
	def create
	   @cannedmessage = Cannedmessage.new(params[:cannedmessage])

     if @cannedmessage.save
        redirect_to :action => :show, :id => @cannedmessage._id
     else
        render 'new'
     end
	
	end
	
	def show
    @cannedmessage = Cannedmessage.find(params[:id])
  end
  
  def index
    @graph = Koala::Facebook::API.new(@oauth_token)
    @profile = @graph.get_object("me")
    @user_id = @profile["id"]
    @cannedmessages = Cannedmessage.where(:facebook_id => @user_id)
  end
	
end