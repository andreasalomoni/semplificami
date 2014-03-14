require 'intersail/attachment_util'

class Document < ActiveRecord::Base
  include Intersail::Util::AttachmentUtil

  has_and_belongs_to_many :practices

  attr_attachment :attachment
end
