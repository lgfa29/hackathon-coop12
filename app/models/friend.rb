class Friend
	def self.has_message(uid)
		return Message.where(:facebook_id => uid).count >= 1
	end
	
	def self.get_message(uid)
		return Message.where(:facebook_id => uid).first
	end
end