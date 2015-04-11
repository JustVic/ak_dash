#require 'net/http'
#require 'json'
require 'open-uri'
#require 'nokogiri'

require 'rubygems'
require 'nokogiri'

 
SCHEDULER.every '10m', :first_in => '2s' do |job|
   
    doc = Nokogiri::HTML(open('http://www.cbr.ru'))
    doc2 = Nokogiri::HTML(open('http://moex.com'))  
  
    tit = doc.xpath('//div[@id="group_mainind"]//div[@class="wrap"]//div[@class="content"]//td[@class="title"]') 
    
    price = doc.xpath('//div[@id="group_mainind"]//div[@class="wrap"]//div[@class="content"]//td//div[@class="w_data_wrap"]')
#    price = '12345678'
    send_event("rubusd", {val: tit.first.content, val2: price.first.content })
end 

