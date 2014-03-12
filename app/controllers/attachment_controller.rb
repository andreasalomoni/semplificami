class AttachmentController < ApplicationController

  before_filter :set_attachment

  def view
    render_modal('Documento', "attachment/embedded")
  end

  def inline
    send_file( @attachment.url, content_type: @attachment.content_type, disposition: 'inline', filename: @attachment.name)
  end

  def download
    send_file( @attachment.url, content_type: @attachment.content_type, disposition: 'attachment', filename: @attachment.name)
  end

  private

  def set_attachment
    @attachment = Attachment.find(params[:id]) || Attachment.find(1)
  end

end