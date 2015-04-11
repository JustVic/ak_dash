#require 'net/http'
#require 'json'
require 'open-uri'
#require 'nokogiri'

require 'rubygems'
require 'nokogiri'
 
SCHEDULER.every '3s', :first_in => '2s' do |job|
  
contents = ""
counter = 1
file = File.open("../../ratox/ratox-0.2.1/rat/*/text_out", "r")

#file.read
counter = 0
while (line = file.gets)
    counter = counter + 1
end
file.close

file = File.open("../../ratox/ratox-0.2.1/rat/*/text_out", "r")
counter2 = 0

i=0
while (line = file.gets)
    if(counter-8<counter2)
    	contents = contents + line
        i=i+1 
    end
    counter2 = counter2 + 1
end
file.close
contents = ""
contents = IO.readlines("../../ratox/ratox-0.2.1/rat/B574A0F3026EA82D414CD3A508937AC0D415D5EA09A1CBD4F7F606E0C02BBD45/text_out")[-5..-1]

    send_event("tox", {val2: contents })
end 
