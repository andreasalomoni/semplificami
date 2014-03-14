require 'intersail/attachment_util'

class Attachment < ActiveRecord::Base
  include Intersail::Util::AttachmentUtil

  after_destroy :destroyStream

  def datasource
    Datasource.new(self.url)
  end
end
