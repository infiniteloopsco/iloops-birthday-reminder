require 'rubygems'
require 'bundler'
Bundler.require(:default)
require './vars'

include Vars
vars = init()

# set up a client to talk to the Twilio REST API
client = Twilio::REST::Client.new vars[:twilio_sid], vars[:twilio_token]

client.account.messages.create({
  :from => vars[:twilio_number],
  :to => vars[:to_number],
  :body => vars[:message]
})