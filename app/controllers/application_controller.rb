class ApplicationController < ActionController::Base
  protect_from_forgery

  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'
  before_filter :parse_data
  before_filter :require_added

    def parse_data

      # This is a typical set of parameters passed by Facebook
      # Parameters: {"signed_request"=>"vsSe9NNeyqom0hAtGyb2L9scc3-aNbY5Xb25EW55LpE.eyJhbGdvcml0aG0iOiJITUFDLVNIQTI1NiIsImV4cGlyZXMiOjEzMDA3NzAwMDAsImlzc3VlZF9hdCI6MTMwMDc2NDg2Niwib2F1dGhfdG9rZW4iOiIxNzE2MDQwOTI4NjgwNTd8Mi4xQnBWNm5mU2VXRm5RT0lOdzltNWFRX18uMzYwMC4xMzAwNzcwMDAwLTE1MjAwMzkxfEFpNXctc2t4WlJyVUd1ZzZvOU95aDZBQmdSZyIsInVzZXIiOnsiY291bnRyeSI6InVzIiwibG9jYWxlIjoiZW5fVVMiLCJhZ2UiOnsibWluIjoyMX19LCJ1c2VyX2lkIjoiMTUyMDAzOTEifQ"}

      # If we have the signed_request parameters, stash them away
      session[:signed_request] = params[:signed_request] if params[:signed_request]

      encoded_user_data = session[:signed_request]

      # We only care about the data after the '.'
      payload = encoded_user_data.split(".")[1]

      # Facebook gives us a base64URL encoded string. Ruby only supports base64 out of the box, so we have to add padding to make it work
      payload += '=' * (4 - payload.length.modulo(4))

      decoded_json = Base64.decode64(payload)
      @signed_data = JSON.parse(decoded_json)

      # This is what your parsed JSON should look like
      # @signed_data => {"expires"=>1300770000, "algorithm"=>"HMAC-SHA256", "user_id"=>"15200391", "oauth_token"=>"171604092868057|2.1BpV6nfSeWFnQOINw9m5aQ__.3600.1300770000-15200391|Ai5w-skxZRrUGug6o9Oyh6ABgRg", "user"=>{"country"=>"us", "locale"=>"en_US", "age"=>{"min"=>21}}, "issued_at"=>1300764866}

      #The existance of an oauth token means the user has given permission to the app.
      @oauth_token = @signed_data["oauth_token"]

    end

    def require_added
      if @oauth_token.to_s.blank?
        render :text=>%|<script>window.top.location.href = "https://graph.facebook.com/oauth/authorize?client_id=#{APP_ID}&redirect_uri=#{CANVAS_URL}&scope=user_likes,friends_birthday";</script>|
        return false
      end
      true
    end
    
    # def read_config
    #      require 'yaml'
    #      facebook_config = YAML.load_file("facebook.yml")
    #      @
    #    end
end
