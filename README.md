redmine_embedded_video
======================

Author: Jan Pilz  (see http://www.redmine.org/issues/5171)

Tested redmine 5.0.3, with ruby 3.1.3.

## Installation
```
git clone https://github.com/demiler/redmine_embedded_video /redmine_directory_path/plugins/redmine_embedded_video
rake redmine:plugins:migrate RAILS_ENV=production
# restart redmine
```

## Usage:

* `{{video(<ATTACHEMENT>|<URL>|<YOUTUBE_URL>[,<width>,<height>])}}`

For external urls just use the complete http url to the video:
* `{{video(http://youtu.be/o9aA9wCQ9co)}}`
 
You can fore video width and height:
* `{{video(http://youtu.be/o9aA9wCQ9co[640,480])}}`

For relative scale just enter one value:
* `{{video(http://youtu.be/o9aA9wCQ9co[640,])}}`


For attached videos, don't use any path in front of attachment filename
* `{{video(History.flv)}}`
* `{{video(vid.swf)}}`


