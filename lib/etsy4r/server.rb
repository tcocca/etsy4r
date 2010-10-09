module Etsy4r
  class Server < Etsy4r::Command
    
    def get_method_table
      @client.process_get('/')
    end
    
    def ping
      @client.process_get('/server/ping')
    end
    
    def get_server_epoch
      @client.process_get('/server/epoch')
    end
    
  end
end
