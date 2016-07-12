require 'socket'
require 'json'

host = 'localhost'     # The web server
port = 2000                           # Default HTTP port
path = "/Users/Home/Desktop/thanks.html"                 # The file we want

puts "Do you want to send a GET request or a POST request?"
answer = gets.chomp.upcase
if answer=="GET"
  request = "GET #{path} HTTP/1.0\r\n\r\n"
elsif answer=="POST"
  puts "Please provide a name."
  name = gets.chomp
  puts "Please provide an email address."
  email = gets.chomp
  data = {:viking=>{:name=>name, :email=>email}}
  json_data = data.to_json
  request = "POST #{path} HTTP/1.0 Content length:#{json_data.length} #{json_data}\r\n\r\n"
end

socket = TCPSocket.open(host,port)  # Connect to server
socket.print(request)               # Send request
response = socket.read              # Read complete response
# Split response at first blank line into headers and body
headers,body = response.split("\r\n\r\n", 2)
print body                          # And display it
print response
socket.close