task :cron => :environment do
	
	begin
		messages = Message.where(:month_bday => Time.now.month, :day_bday => Time.now.day, :hour_send.lte => Time.now.hour, :min_send.lte => Time.now.min)
		
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