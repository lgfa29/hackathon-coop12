module FriendsHelper
  def day_and_month(date)
    splitted_date = date.split('/')
    splitted_date[0]+'/'+splitted_date[1]
  end
end
