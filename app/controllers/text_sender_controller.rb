require 'rubygems'
require 'twilio-ruby'

account_sid =  "AC810e6bc2b5f92cb7b59025d3269b6997"
auth_token = "435264bc4f065b988c6dccba3e936b4e"
client = Twilio::REST::Client.new account_sid, auth_token
from = "6697211953" # Your Twilio number
friends = {
"+14084804906" => "Gibril Sillah",

}
friends.each do |key, value|
client.account.messages.create(
:from => from,
:to => key,
:body => "Hey #{value}, is it me you waiting for "
)
puts "Sent message to #{value}"
end