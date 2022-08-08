class UserSerializer
  include JSONAPI::Serializer
  type "users"
  id :id
  attributes :email, :api_key
end
