require 'redmine'
#require 'dispatcher'

Redmine::Plugin.register :redmine_embedded_video do
 name 'Redmine Embedded Video'
 author 'Nikolay Kotlyarov, PhobosK, Jan Pilz'
 description 'Embeds attachment videos, video URLs or Youtube videos. Usage (as macro): video(ID|URL|YOUTUBE_URL). Updated to use iframes and video html5 tag'
 version '0.0.3.2'
end

Redmine::WikiFormatting::Macros.register do
   desc "Wiki video embedding"

    macro :video do |o, args|
        @width = args[1].gsub(/\D/,'') if args[1]
        @height = args[2].gsub(/\D/,'') if args[2]
        @width ||= 400
        @height ||= 225
        attachment = o.attachments.find_by_filename(args[0]) if o.respond_to?('attachments')

        if attachment
            file_url = url_for(
                :only_path => false,
                :controller => 'attachments',
                :action => 'download',
                :id => attachment,
                :filename => attachment.filename
            )
            # TODO: add type detection and better width, height
out = <<END
<video width="#{@width}" height="#{@height}" playsinline controls>
  <source src="#{file_url}">
  Your browser does not support the video tag.
</video>
END
        else
            file_url = args[0].gsub(/<.*?>/, '').gsub(/&lt;.*&gt;/,'')
out = <<END
<iframe width="#{@width}" height="#{@height}" src="#{file_url}"></iframe>
END
        end

    out.html_safe
  end
end
