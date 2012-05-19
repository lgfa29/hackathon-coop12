class HomeController < ApplicationController
  def index
    @graph = Koala::Facebook::API.new(@oauth_token)
    query="SELECT name, birthday_date, pic_square FROM user WHERE uid IN (SELECT uid2 FROM friend WHERE uid1 = me()) 
                                                          AND strlen(birthday_date) != 0 
                                                          AND (substr(birthday_date, 0, 2) = '05' 
                                                          AND substr(birthday_date, 3, 5) >= '19')  
                                                          ORDER BY birthday_date"
    @aniversarios = @graph.fql_query(query)
    
    @mensages_agendadas = Messages.all
    
    #@api.put_wall_post(process_result(fql))
    #@likes = @graph.get_connections("me", "likes")
  end
end