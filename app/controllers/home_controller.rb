class HomeController < ApplicationController
  def index
    @graph = Koala::Facebook::API.new(@oauth_token)

    start_date = Date.today
    end_date = start_date+4.weeks

    query="
        SELECT name, birthday_date, pic_square 
        FROM user WHERE uid IN (SELECT uid2 FROM friend WHERE uid1 = me()) 
        AND strlen(birthday_date) != 0 
        AND ((substr(birthday_date, 0, 2) = '%s' AND substr(birthday_date, 3, 5) >= '%s')
        OR (substr(birthday_date, 0, 2) = '%s' AND substr(birthday_date, 3, 5) < '%s'))
        ORDER BY birthday_date" % [start_date.month, start_date.day, end_date.month, end_date.day]
        
    @aniversarios = @graph.fql_query(query)
 
    
    #@api.put_wall_post(process_result(fql))
    #@likes = @graph.get_connections("me", "likes")
  end
end