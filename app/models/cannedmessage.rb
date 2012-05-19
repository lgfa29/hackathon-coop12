class Cannedmessage 
	include Mongoid::Document
  
	field :facebook_id, type: String
	field :title, type: String
	field :message, type: String

 # attr_accessible :message, :title
end