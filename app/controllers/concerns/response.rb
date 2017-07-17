module Response
  def json_response(object, status = :ok)
    render json: object, status: status
    # render object.as_json(only: :author), status: status
  end
end
