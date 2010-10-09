module Etsy4r
  class Response
    
    attr_accessor :body, :http_response
    
    def initialize(response, raise_error = true)
      self.http_response = response
      rash_response(response)
      raise Error.new(self.http_response.code, self.http_response.message, self.http_response.headers) if !success? && raise_error
    end
    
    def success?
      [200, 201].include?(self.http_response.code)
    end
    
    def method_missing(method_name, *args)
      if self.body.respond_to?(method_name)
        self.body.send(method_name)
      else
        super
      end
    end
    
    private
    
    def rash_response(response)
      if response.is_a?(Array)
        self.body = []
        response.each do |b|
          if b.is_a?(Hash)
            self.body << Hashie::Rash.new(b)
          else
            self.body << b
          end
        end
      elsif response.is_a?(Hash)
        self.body = Hashie::Rash.new(response)
      else
        self.body = response
      end
    end
    
  end
end
