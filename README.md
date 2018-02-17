
Zoom Tiny
=========

A self-contained instance of [Zoom](https://github.com/dsilabs/zoom) suitable for playing around.


usage:

    $ docker build -t zoom-tiny .
    $ docker run -d -p 8080:8080 --name zoom-tiny-dev zoom-tiny

then go to http://locahost:8080 in your browser.
