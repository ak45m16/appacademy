require 'socket'               # Get sockets from stdlib
require 'json'

server = TCPServer.open(2000)  # Socket to listen on port 2000
loop {                         # Servers run forever
  client = server.accept       # Wait for a client to connect
  string = client.gets
  request = string.split(" ")
  if request[0]=="GET"
    path = request[1]
    if File.exist?(path)
      puts "HTTP/1.0 200 OK"
      client.puts "HTTP/1.0 404 NOT FOUND"
      puts path.length
      client.puts "HTTP/1.0 404 NOT FOUND"
      client.puts(File.read(path))
    else
      puts "HTTP/1.0 404 NOT FOUND"
      client.puts "HTTP/1.0 404 NOT FOUND"
    end
  elsif request[0]=="POST"
    json_data = request[-1]
    params = JSON.parse(json_data)
    name=params["viking"]["name"]
    email=params["viking"]["email"]
    info="<li>Name: #{name}</li><li>Email: #{email}</li>"
    if File.exist?(request[1])
      file = File.read(request[1])
      client.puts file.gsub("<%= yield %>", info)
    else
      client.puts "HTTP/1.0 404 NOT FOUND"
    end
  end
  client.puts "Closing the connection. Bye!"
  client.close                 # Disconnect from the client
}