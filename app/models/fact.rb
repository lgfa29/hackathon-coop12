class Fact
	include Mongoid::Document
	
	field :date, type: DateTime
	field :text, type: String
end