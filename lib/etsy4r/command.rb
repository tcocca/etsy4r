module Etsy4r
  class Command
    
    attr_accessor :client
    
    def initialize(client)
      @client = client
    end
    
  end
end
