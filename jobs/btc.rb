require 'net/http'
require 'json'
 
SCHEDULER.every '10s', :first_in => '1s' do |job|
uri = URI.parse("https://btc-e.com/api/2/btc_usd/ticker")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
request = Net::HTTP::Get.new(uri.request_uri)
response = http.request(request)
body = JSON.parse(response.body)
 

send_event("btc", {val: body['ticker']['last'] })
end 
