require 'intersail/attachment_util'

class Attachment < ActiveRecord::Base
  include Intersail::Util::AttachmentUtil

  def url
    getUrl(self)
  end

  def datasource
    Datasource.new(self.url)
  end

end
