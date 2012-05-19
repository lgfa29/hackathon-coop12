class Message
	include Mongoid::Document

	field :facebook_id, type: String
	field :receiver_bday, type: DateTime
	field :message, type: String
	field :send_date, type: DateTime
end