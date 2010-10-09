module Etsy4r
  class Error < Exception
    
    attr_reader :code, :error, :headers
    
    def initialize(code, error, headers)
      @code = code
      @error = error
      @headers = headers
      super(message)
    end
    
    def message
      meaning = translate_code
      unless meaning.blank?
        "Etsy4r Error: #{meaning} (code: #{@code}, error: #{@error})"
      else
        "Etsy4r Error: #{@error} (code: #{@code})"
      end
    end
    
    private
    
    def translate_code
      if headers.has_key?("x-error-detail")
        headers["x-error-detail"]
      elsif headers.has_key?("x-mashery-error-code")
        parts = headers["x-mashery-error-code"].split('_', 3)
        if parts.size == 3
          parts[2].split('_').collect{|s| s.capitalize}.join(' ')
        end
      end
    end
    
  end
end
