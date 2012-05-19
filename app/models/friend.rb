class Friend
	def self.has_message(uid)
		return Message.where(:facebook_id => uid).count >= 1
	end
	
	def self.get_message(uid)
		return Message.where(:facebook_id => uid).first
	end
	
	def self.get_send_hour(uid)
		msg = Message.where(:facebook_id => uid).first
		return "#{msg.hour_send}:#{msg.min_send}"
	end
end