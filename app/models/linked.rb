class Linked < ApplicationRecord
end

class LinkedFilter
  include Minidusen::Filter

  filter :text do |scope, phrases|
    columns = [:url, :file_hash]
    scope.where_like(columns => phrases)
  end
end
