module Etsy4r
  class Response
    
    attr_accessor :body, :http_response, :paginator_cache
    
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
    
    def current_page
      if self.body.params && self.body.params.limit && self.body.params.offset
        self.body.params.offsett == 0 ? 1 : self.body.params.offset/self.body.params.limit + 1
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
    
    def paginator
      return paginator_cache if paginator_cache
      if self.body.params && self.body.params.limit && self.body.params.offset
        self.paginator_cache = WillPaginate::Collection.create(self.current_page, self.body.params.page, self.body.count) do |pager|
          pager.replace self.body.results
        end
      else
        self.paginator_cache = nil
      end
    end
    
  end
end
