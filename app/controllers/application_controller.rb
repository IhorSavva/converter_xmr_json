class ApplicationController < ActionController::API
  def convert_from_xml
    begin
      hash = Hash.from_xml(request.body.read)
      if hash.nil?
        return head :bad_request
      end
    rescue Exception
      return head :bad_request
    end

    render json: hash
  end

  def convert_from_json
    begin
      hash = params.to_unsafe_h
      if hash.nil?
        return head :bad_request
      end
    rescue Exception
      return head :bad_request
    end

    render xml: hash.to_xml
  end
end
