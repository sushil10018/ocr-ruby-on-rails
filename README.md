# Convert image into text

This is an example app that uses the following gems to upload images for your Rails application and get the text extracted:

* [jquery-fileupload-rails](https://github.com/tors/jquery-fileupload-rails)
* [Paperclip](https://github.com/thoughtbot/paperclip)
* [ruby-tesseract-ocr](https://github.com/meh/ruby-tesseract-ocr)

This app also uses [twitter-bootstrap-rails](https://github.com/seyhunak/twitter-bootstrap-rails) but is not required.

This app uses Rails 3.2.13.

## Install the libraries required

This app requires [ruby-tesseract-ocr](https://github.com/meh/ruby-tesseract-ocr) gem which does have some pre-requisites. As mentioned in the gem spec to make this library work you need tesseract-ocr and leptonica libraries and headers and a C++ compiler.

### For Ubuntu
Follow the instructions as mentioned in [UbuntuForum](http://ubuntuforums.org/showthread.php?t=1647350)
    

## Running the app

    rake db:create
    rake db:migrate
    rails server

Open http:://localhost:3000

## License
The Unlicense (i.e Public Domain)

