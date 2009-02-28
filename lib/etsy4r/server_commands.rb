module Etsy4r
  class ServerCommands < Etsy4r::Commands
    
    def get_method_table
      @client.process('/')
    end
    
    def ping
      @client.process('/server/ping')
    end
    
    def get_server_epoch
      @client.process('/server/epoch')
    end
    
  end
end
