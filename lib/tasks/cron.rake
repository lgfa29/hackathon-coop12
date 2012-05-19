task :cron => :environment do
	
	begin
		messages = Message.where(:month_bday => Time.now.month, :day_bday => Time.now.day, :hour_send.gte => Time.now.hour, :hour_send.lt => Time.now.hour + 10.minute, :min_send.gte => Time.now.min, :min_send.lt => Time.now.min + 10.minute)
		
		puts ">> Mensagens a serem enviadas: #{messages.all.count}"
				
		messages.each do |m|
			puts ">>	Enviando mensagem: #{m.message} para #{m.facebook_id}"
			
			@graph = Koala::Facebook::API.new(m.token)
			@graph.put_wall_post(m.message, {}, m.facebook_id, {})
			
			puts">>		Apagando mensagem #{m.message}..."
			m.destroy
		end
		
		puts ">> Fim"
		
	rescue Exception => e
		puts ">> [ERROR] #{e}"
    	puts ">> [ERROR] #{e.message}"
    end
	
end