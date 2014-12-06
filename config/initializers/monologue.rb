Monologue.config do |config|
  config.site_name = "STUTERN | connects interns with employers"
  # config.site_subtitle = "my own place online"
  config.site_url = "http://stutern.com"

  config.meta_description = "Connects interns with employers"
  config.meta_keyword = "inters, employers"

  config.admin_force_ssl = false
  config.posts_per_page = 10

  config.disqus_shortname = "STUTERN"

  # LOCALE
  config.twitter_locale = "en" # "fr"
  config.facebook_like_locale = "en_US" # "fr_CA"
  config.google_plusone_locale = "en"

  config.layout               = "layouts/application"

  # ANALYTICS
  # config.gauge_analytics_site_id = "YOUR COGE FROM GAUG.ES"
  # config.google_analytics_id = "YOUR GA CODE"

  config.sidebar = ["latest_posts", "latest_tweets", "categories", "tag_cloud"]


  #SOCIAL
  config.twitter_username = "stutern"
  config.facebook_url = "https://www.facebook.com/stuternpage"
  config.facebook_logo = 'logo.png'
  # config.google_plus_account_url = "https://plus.google.com/u/1/115273180419164295760/posts"
  config.linkedin_url = "http://www.linkedin.com/stutern"
  # config.github_username = "jipiboily"
  config.show_rss_icon = true

end