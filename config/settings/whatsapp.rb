# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'



account_sid = 'ACa94aad198da847162cc490452aeba527'
auth_token = 'dab9ad34b7a6d18fec0c7e915e4da92e'
from_phone_number = '+14807250732'

client = Twilio::REST::Client.new(account_sid, auth_token)

message = client.messages.create(
  body: 'Hello, this is a test message.',
  from: from_phone_number,
  to: 'recipient_phone_number'
)

puts "Message SID: #{message.sid}"

# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# ajoutez un numero

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

phone_number = @client.proxy
                      .v1
                      .services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                      .phone_numbers
                      .create(sid: 'PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

puts phone_number.sid



