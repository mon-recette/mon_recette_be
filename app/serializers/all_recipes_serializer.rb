class AllRecipesSerializer
  include JSONAPI::Serializer
  attributes :name, :instructions, :ingredients
end