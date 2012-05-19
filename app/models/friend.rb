class Friend
	include Mongoid::Document

	field :facebook_id, type: String
	field :message, type: String
	field :send_date, type: DateTime
end