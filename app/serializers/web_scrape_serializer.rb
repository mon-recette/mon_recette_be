class WebScrapeSerializer
  include JSONAPI::Serializer
  attributes :name, :instructions, :ingredients 

end