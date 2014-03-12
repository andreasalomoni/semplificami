module ApplicationHelper
  def shallow_args(parent, child)
    child.try(:new_record?) ? [parent, child] : child
  end

  def fileAttachmentLinkView (attachment)

    emptyHtml = '-'

    return emptyHtml if attachment.nil? || attachment.xid.nil?

    link_to(attachment_view_path(attachment), remote: true, class: 'present btn btn-small', title: attachment.name) do
      content_tag(:i, '', class: 'icon-eye-open icon-white')
    end

  end

  def fileAttachmentLinkTable(attachment)
    return '-' if attachment.nil?

    link_to(datasource_show_path(attachment), remote: true, class: 'present btn btn-small', title: attachment.name) do
      content_tag(:i, '', class: 'icon-table icon-white')
    end
  end


  #gestise l'html dei campi definiti come attachment
  def fileAttachmentLinkDownload (attachment)

    emptyHtml = '-'

    return emptyHtml if attachment.nil? || attachment.xid.nil?

    link_to(attachment_download_path(attachment), class: 'present btn btn-small', target: '_blank', title: attachment.name) do
      content_tag(:i, '', class: 'icon-download-alt icon-white')
    end
  end

  def html_concat(*items)
    items.join.html_safe
  end

  def ul(items, options=[])
    items.map! { |i| content_tag(:li, i) }

    content_tag(:ul, options) do
      html_concat(items)
    end
  end

  def attachmentLink(attachment, linkTypes)
    return '-' if attachment.nil?

    linkTypes.map! { |l| send("fileAttachmentLink#{l}", attachment) }

    content_tag(:div, class: 'btn-group') do
      html_concat(
          link_to(href: '#', class: 'btn btn-small dropdown-toggle', data: {toggle: 'dropdown' }, title: attachment.name) do
            html_concat(
                t('view'),
                content_tag(:span, '', class: 'caret')
            )
          end,
          ul(linkTypes, class:'dropdown-menu')
      )
    end

  end

  def strong(args)
    content_tag(:strong, args)
  end

  def progressBar(shipment)

      tot = shipment.outboxes.count

      tooltip = "<table style='color:black'>".html_safe

    html = ''
      Outbox.stato.values.each do |status|
        next if status == 'UNDEFINED'
        v = shipment.outboxes.having_status(status.to_s).count
        k = status
        w = tot==0 ? 0 : (10000 * v) / (100 * tot)
        html << content_tag(:div, class: "bar progress-bar #{k}", style: "width: #{w}%") do
          #content_tag(:span, "#{v}".html_safe, class:'sr-only')
        end

        tooltip << content_tag(:tr,
          [
            content_tag(:td, "#{k.humanize}"),
            content_tag(:td, "#{v}")
          ].join.html_safe)

      end

      tooltip << content_tag(:tr,
        [
            content_tag(:td, strong('TOTALE INVII')),
            content_tag(:td, strong("#{tot}"))
        ].join.html_safe)

      tooltip << '</table>'.html_safe

      content_tag(:div,html.html_safe,class:'progress has_tooltip', title: tooltip, data: {toggle: 'tooltip', placement: 'left', html: 'true'} )
  end


  def div(arg = nil)
    if block_given?
      content_tag(:div) do
        yield
      end
    else
      content_tag(:div, arg.to_s)
    end
  end
  alias :d :div


  def table_fixed
    content_tag(:div, (content_tag(:div, class: 'table-fixed-header-inner') do
      yield
    end
    ), class: 'table-fixed-header-container')
  end
end
