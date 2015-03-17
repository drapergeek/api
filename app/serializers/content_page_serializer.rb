# == Schema Information
#
# Table name: content_pages
#
#  id         :integer          not null, primary key
#  staff_id   :integer
#  created_at :datetime
#  updated_at :datetime
#  deleted_at :datetime
#  title      :string(255)      not null
#  slug       :string(255)      not null
#  body       :text
#
# Indexes
#
#  index_content_pages_on_slug      (slug) UNIQUE
#  index_content_pages_on_staff_id  (staff_id)
#

class ContentPageSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at, :deleted_at, :staff_id, :slug, :title, :body
end
