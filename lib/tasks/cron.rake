task :cron => :environment do
	
	begin
		messages = Message.where(
					:month_bday => Time.now.month, 
					:day_bday => Time.now.day, 
					:hour_send.gte => Time.now.hour, 
					:hour_send.lt => Time.now.hour + 30.minute, 
					:min_send.gte => Time.now.min, 
					:min_send.lt => Time.now.min+30.minute)
		
		messages.each do |m|
			
		end
		
	rescue Exception => e
		puts ">> [ERROR] #{e}"
    	puts ">> [ERROR] #{e.message}"
	
end