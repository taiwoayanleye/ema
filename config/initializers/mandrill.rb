# require 'mandrill'
# m = Mandrill::API.new # All official Mandrill API clients will automatically pull your API key from the environment
# rendered = m.templates.render 'Thanks for the Time', [{:name => 'main', :content => 'The main content block'}]
# puts rendered['html'] # print out the rendered HTML