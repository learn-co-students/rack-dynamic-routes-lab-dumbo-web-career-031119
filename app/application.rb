 class Application
    
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_name = req.path.split("/items/").last

            @@items.find do |item| 
                if item.name == item_name
                    resp.write item.price
                elsif item == @@items.last
                    resp.write "Error: Item not found"
                    resp.status = 400
                end
            end
        else
            resp.write "Error: Route not found."
            resp.status = 404
        end
        resp.finish
    end
end
  