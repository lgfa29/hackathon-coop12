class Fact
	include Mongoid::Document
	
	field :day, type: Integer
	field :month, type: Integer
	field :year, type: Integer
	field :text, type: String
end