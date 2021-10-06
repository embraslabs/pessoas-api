json.array! @tickets do |ticket|
  json.id ticket.id
  json.status ticket.status
  json.person ticket.person.name
  json.created_at ticket.created_at
end