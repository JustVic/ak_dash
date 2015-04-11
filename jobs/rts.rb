#require 'net/http'
#require 'json'
require 'open-uri'
#require 'nokogiri'

require 'rubygems'
require 'nokogiri'
 
SCHEDULER.every '10m', :first_in => '2s' do |job|
  
doc = Nokogiri::HTML(open("http://finance.yahoo.com/q?s=RTS.RS"))  

 price = doc.xpath('//*[@id="yfs_l10_rts.rs"]').text

    send_event("rts", {val2: price })
end 
