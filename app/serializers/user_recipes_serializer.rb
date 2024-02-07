class UserRecipesSerializer
  include JSONAPI::Serializer
  attributes :user_id, :recipes
end