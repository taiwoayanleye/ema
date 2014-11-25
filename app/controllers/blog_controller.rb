class BlogController < ApplicationController
  def index

    # Keys given from Tumblr API
    @key = ENV["TUMBLR_KEY"]
    @secret = ENV["TUMBLR_SECRET_KEY"]
    @oauth_token = ENV["TUMBLR_OAUTH_TOKEN"]
    @oauth_token_secret = ENV["TUMBLR_OAUTH_TOKEN_SECRET"]

    # Sets the client that allows interfacing with Tumblr
    @myClient = Tumblr::Client.new(
      :consumer_key => @key,
      :consumer_secret => @secret,
      :oauth_token => @oauth_token,
      :oauth_token_secret => @oauth_token_secret
    )

    @posts = @myClient.posts("stutern.tumblr.com")
    @posts = Kaminari.paginate_array(@posts["posts"]).page(params[:page]).per(10)

    # # Photography posts only (other types follow the same pattern)
    # @photoPosts = @myClient.posts("YOURTUMBLR.tumblr.com", 
    #                               :limit => 5, 
    #                               :type => "photo")
    # @photoPosts = @photoPosts["posts"]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
end