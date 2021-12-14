json.set! :writers do
  json.array! @writers do |writer|
    json.partial! 'api/v1/writers/writer', writer: writer
  end
end
