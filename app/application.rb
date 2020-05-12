class Application
 #require "pry"
 def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
        #Turns /items/<Item Name> into <Item Name>
        item_name = req.path.split("/items/").last
  #Check if the searched for item is an object in the Item class
        item = Item.all.find{|i| i.name == item_name}
        if item  
          #Returns item price if it is in @@item  
          resp.write "#{item.price}"
        else
            #Otherwise returns an error & status code 400
            resp.status = 400
            resp.write "Item not found"
            #binding.pry
        end
    else
        #Returns status code 404 for a bad route
        resp.status = 404
        resp.write "Route not found"
    end
    resp.finish
 end


end