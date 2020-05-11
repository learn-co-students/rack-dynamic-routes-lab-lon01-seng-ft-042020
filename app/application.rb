class Application

    @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]
  
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_title = req.path.split("/items/").last 
            item = @@items.find{|item| item.name == item_title}
            if item
            resp.write item.price
        else 
            resp.status = 400
            resp.write "Item not found" 
        end
    else
        resp.write "Route not found"
        resp.status = 404
    end 
    resp.finish
    end
 end 