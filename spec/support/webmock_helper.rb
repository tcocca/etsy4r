def mock_get(base_uri, method, response_fixture, params = {})
  url = base_uri + method
  unless params.blank?
    stub_http_request(:get, url).with(:query => params).to_return(:body => mocked_response(response_fixture))
  else
    stub_http_request(:get, url).to_return(:body => mocked_response(response_fixture))
  end
end

def mocked_response(response_fixture)
  File.read(File.join(File.dirname(__FILE__), '/../fixtures/responses', "#{response_fixture}.json"))
end

def httparty_get(base_uri, method, response_fixture, params = {})
  mock_get(base_uri, method, response_fixture, params)
  HTTParty.get url, :format => :json
end
