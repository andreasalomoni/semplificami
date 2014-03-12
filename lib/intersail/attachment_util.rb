module Intersail
  module Util
    module  AttachmentUtil

      def self.destination_path
        Rails.root.join('public','attachments')
      end
      def getUrl(attachment)
        AttachmentUtil.destination_path.join("#{attachment.xid}").to_s
      end

      def saveStream(stream, opt = {})
          xid = Time.now.to_formatted_s(:nsec)

          path = AttachmentUtil.destination_path.join("#{xid}").to_s

          File.atomic_write(path) do |f|
            f.write(stream.read)
          end

          Attachment.new(xid: xid, name: opt[:name] || stream.original_filename, content_type: opt[:content_type] || stream.content_type )
      end
     end
  end
end

class Class
  #crea il getter e setter degli argomenti passati
  def attr_attachment(*args)

    #iteriamo sulle chiavi
    args.each do |arg|

      #relation
      self.class_eval("belongs_to :#{arg}, class_name: 'Attachment'")
      #setter
      self.class_eval("def #{arg}Stream=val; self.#{arg}=saveStream(val); end")
    end

    #save
    #self.class_eval("def save; super && #{args.map{|v| v.to_s+'.save'}.join(' && ')}; end")
  end



end


