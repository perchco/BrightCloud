require 'spec_helper'

describe BrightCloud::Requests::DomainRequest do

  it 'returns an endpoint' do
    domain_request = BrightCloud::Requests::DomainRequest.new
    result = domain_request.endpoint(domain: 'perch.co')

    expect(result).to eq 'http://thor.brightcloud.com/rest/uris/perch.co'
  end

end
