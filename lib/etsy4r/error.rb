module Etsy4r
  class Error < Exception
    
    attr_reader :code, :error, :mashery_error
    
    def initialize(code, error, mashery_error_message)
      @code = code
      @error = error
      @mashery_error = mashery_error_message
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
      parts = @mashery_error.split('_', 3)
      if parts.size == 3
        parts[2].split('_').collect{|s| s.capitalize}.join(' ')
      end
    end
    
  end
end
