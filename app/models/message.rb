class Message
	include Mongoid::Document

	field :facebook_id, type: String
	field :token, type: String
	field :month_bday, type: Integer
	field :day_bday, type: Integer
	field :message, type: String
	field :hour_send, type: Integer
	field :min_send, type: Integer
	
end