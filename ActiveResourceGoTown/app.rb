require 'reactive_resource'

class ReactiveResource::Town < ReactiveResource::Base
  has_many :events
  self.site = "http://www.gotown.com/"
  self.element_name = "towns"
end

class ReactiveResource::Event < ReactiveResource::Base
  belongs_to :town
end

town = ReactiveResource::Town.find(1)
p town.events

