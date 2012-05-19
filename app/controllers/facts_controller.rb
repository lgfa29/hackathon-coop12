class FactsController < ApplicationController

	def populate_db

		require 'nokogiri'

		months = ['jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug', 'sep', 'oct', 'nov', 'dec']

		day = Date.new(2012, 1, 1)
		limit = Date.new(2012, 2, 29)
		while day <  limit do
			url = "http://www.factmonster.com/dayinhistory?month="+months[day.month - 1]+"&day="+day.day.to_s+"&submit=Go%21"
			doc = Nokogiri::HTML(open(url))
			years = []
			doc.css("h3").each do |year|
				years <<  year.text
			end
			facts = []
			doc.css("p").each do |fact|
				facts << fact.text
			end
			i = 0
			years.each do |year|
				f = Fact.create
				f.text = "#{year} - #{facts[i]}"
				f.date = Date.new(year.to_i, day.month, day.day)
				f.save
				i = i + 1
			end
			day += 1.day
		end

		day = Date.new(2012, 3, 1)
		limit = Date.new(2013, 1, 1)
		while day < limit do 
			url = "http://www.factmonster.com/dayinhistory?month="+months[day.month - 1]+"&day="+day.day.to_s+"&submit=Go%21"
			doc = Nokogiri::HTML(open(url))
			years = []
			doc.css("h3").each do |year|
				years <<  year.text
			end
			facts = []
			doc.css("p").each do |fact|
				facts << fact.text
			end
			i = 0
			years.each do |year|
				f = Fact.create
				f.text = "#{year} - #{facts[i]}"
				f.date = Date.new(year.to_i, day.month, day.day)
				f.save
				i = i + 1
			end
			day += 1.day
		end

		render :text => "ok"

	end
end