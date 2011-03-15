require 'nokogiri'
require 'open-uri'

module XMLConsumer

  def initialize( document_url )
    @document_url = document_url
    @methods = Hash.new
    @xpath = Hash.new
    @object_elements = Hash.new
  end

  def find( method_name, parameters )
    document = read_document( method_name, parameters )
    elements = search_elements( document, method_name )
    #TODO convert the elements to Objects depending on the method
    p elements
  end

  def read_document( method_name, parameters)
    url = compose_URL( method_name, parameters )
    Nokogiri::XML( open(url) )
  end

  def search_elements( document, method_name )
     return document.xpath( @xpath[method_name] )
  end

  def compose_URL( method_name, parameters )
    url = @document_url + @methods[method_name] + "?"
    params = parameters.to_a
    params.collect!{|param| "#{param[0]}=#{param[1]}" }
    url += params.join("&")
    return url
  end

end

class MASFlightXMLConsumer
  include XMLConsumer

  def initialize( documentURL )
    super( documentURL)
  end

  def add_xpath( method_name , xpath )
    @xpath[method_name] = xpath
  end

  def add_object_elements( method_name , elements )
    @object_elements[method_name] = elements
  end

  def add_method( method_name , urlName )
    @methods[method_name] = urlName
  end
end

consumer = MASFlightXMLConsumer.new( "http://173.201.189.177:8080/WebSAirPort2/" )
consumer.add_method( "operations_type", "OperationsTypeQueryRest" )
consumer.add_xpath( "operations_type", "//AirPortOperations" )
consumer.add_object_elements( "operations_type", [ 'years', 'hours', 'days', 'months' ] )

consumer.find( "operations_type", { :airportId => "ANC", :initialdate => "20090801", :finaldate => "20100801", :op => "o" })
