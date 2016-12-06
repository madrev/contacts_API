require 'addressable/uri'
require 'rest-client'

def index_users
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.html'
  ).to_s

  puts RestClient.get(url)
end

def show_nested
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1.json',
    query_values: {
  'some_category[a_key]' => 'another value',
  'some_category[a_second_key]' => 'yet another value',
  'some_category[inner_inner_hash][key]' => 'value',
  'something_else' => 'aaahhhhh'
}
  ).to_s

  puts RestClient.get(url)
end

def create_user(name, email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.post(
    url,
    { user: { name: name, email: email } }
  )
end

begin
  create_user("Gizmo", "gizmo@gizmo.gizmo")
rescue RestClient::Exception => e
  puts e
end


# index_users
# show_nested
