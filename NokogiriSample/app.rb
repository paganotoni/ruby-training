require 'nokogiri'
require 'open-uri'

document = Nokogiri::XML(open( "http://www.gotown.com/towns" ))
city_names = document.xpath( "//city//name")

for name in city_names
  p name.content
end

