class WebScrapSerializer
  include JSONAPI::Serializer
  attributes :name, :instructions 

  attribute :ingredients do |ingredient|
    require 'pry'; binding.pry
  end
end