class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :token, :google_id
end
