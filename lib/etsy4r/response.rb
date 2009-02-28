module Etsy4r
  class Response
    
    attr_accessor :body
    
    def initialize(body)
      @body = body
    end
    
    def results
      @body['results']
    end
    
    def count
      @body['count']
    end
    
    def type
      @body['type']
    end
    
    def params
      @body['params']
    end
    
    def success?
      results && !results.empty?
    end
    
    def error_message
      if !success?
        @body
      end
    end
    
  end
end
