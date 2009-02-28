module Etsy4r
  class ServerCommands
    
    attr_accessor :client
    
    def initialize(client)
      @client = client
    end
    
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
