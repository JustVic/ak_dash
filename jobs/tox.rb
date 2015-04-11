#require 'net/http'
#require 'json'
require 'open-uri'
#require 'nokogiri'

require 'rubygems'
require 'nokogiri'
 
SCHEDULER.every '3s', :first_in => '2s' do |job|
  
contents = ""



#contents = IO.readlines("../../ratox/ratox-0.2.1/rat/B574A0F3026EA82D414CD3A508937AC0D415D5EA09A1CBD4F7F606E0C02BBD45/text_out")[-5..-1]

#contents = IO.readlines("../../ratox/ratox-0.2.1/rat/*/text_out")[-5..-1]

Dir.glob("../../ratox/ratox-0.2.1/rat//*/text_out") do |item|
    lines = IO.readlines(item).last(3)
    if (lines !=nil)
    lines.each do |elem|
     contents = contents + elem
    end
    end
end


    send_event("tox", {val2: contents })
end 
