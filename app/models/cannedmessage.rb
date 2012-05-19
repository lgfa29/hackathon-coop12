class CannedMessage
	include Mongoid::Document

	field :facebook_id, type: String
	field :message, type: String

end