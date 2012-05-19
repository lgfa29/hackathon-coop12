class MessageController < ApplicationController
	def cancel_message
		uid = params['id']
		msg = Message.where(:facebook_id => uid)
		render :text => msg.destroy
	end
end