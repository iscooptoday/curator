json.array!(@link_attachments) do |link_attachment|
  json.extract! link_attachment, :id, :link_id, :avatar
  json.url link_attachment_url(link_attachment, format: :json)
end
