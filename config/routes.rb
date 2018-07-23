Rails.application.routes.draw do
    post '/convert', to: 'application#convert_from_json', constraints: lambda { |req| req.env['CONTENT_TYPE'] == 'application/json' }

    post '/convert', to: 'application#convert_from_xml', constraints: lambda { |req| req.env['CONTENT_TYPE'] == 'application/xml' }
end
