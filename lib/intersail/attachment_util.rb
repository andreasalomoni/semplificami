module Intersail
  module Util
    module  AttachmentUtil

      def self.destination_path
        Rails.root.join('public','attachments')
      end
      def url
        AttachmentUtil.destination_path.join("#{self.xid}").to_s if(self.respond_to? :xid)
      end

      def saveStream(stream, opt = {})
          xid = Time.now.to_formatted_s(:nsec)

          path = AttachmentUtil.destination_path.join("#{xid}").to_s

          File.atomic_write(path) do |f|
            f.write(stream.read)
          end

          Attachment.new(xid: xid, name: opt[:name] || stream.original_filename, content_type: opt[:content_type] || stream.content_type )
      end

      def destroyStream
        File.delete url if url
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
      self.class_eval("belongs_to :#{arg}, class_name: 'Attachment', dependent: :destroy")
      #setter
      self.class_eval("def #{arg}Stream=val; self.#{arg}=saveStream(val); end")
    end

    #save
    #self.class_eval("def save; super && #{args.map{|v| v.to_s+'.save'}.join(' && ')}; end")
  end



end


