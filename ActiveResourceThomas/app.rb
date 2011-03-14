require 'active_resource'

class Resources < ActiveResource::Base
    self.site = "http://www.thomas-bayer.com/sqlrest/CUSTOMER"
    self.element_name = "CUSTOMERList"
end

p Resources.find(:all)

