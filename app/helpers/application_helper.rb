module ApplicationHelper
  def response_payload
    JSON.parse(response.body, symbolize_names: true)
  end
end
