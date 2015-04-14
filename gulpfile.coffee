http = require 'http'
gulp = require 'gulp'
express = require 'express'

source     = require 'vinyl-source-stream'
buffer     = require 'vinyl-buffer'
coffeeify  = require 'coffeeify'
browserify   = require 'browserify'
watchify = require 'watchify'

gif = require 'gulp-if'
jade = require 'gulp-jade'
uglify = require 'gulp-uglify'
concat = require 'gulp-concat'
plumber = require 'gulp-plumber'
reload = require 'gulp-livereload'
autoprefixer = require 'gulp-autoprefixer'
csso = require 'gulp-csso'
autowatch = require 'gulp-autowatch'

nib = require 'nib'

cssSupport = [
  'last 5 versions',
  '> 1%',
  'ie 8',
  'ie 7',
  'ie 6',
  'Android 4',
  'BlackBerry 10'
]

# paths
paths =
  images: './client/images/**/*'
  coffee: './client/**/*.coffee'
  bundle: './client/index.coffee'
  jade: './client/**/*.jade'
  fonts: './client/fonts/*'

gulp.task 'server', (cb) ->
  require './index.js'

# javascript
args =
  debug: true
  fullPaths: true
  cache: {}
  packageCache: {}
  extensions: ['.coffee']

bundler = watchify browserify paths.bundle, args
bundler.transform coffeeify

gulp.task 'coffee', ->
  bundler.bundle()
    .once 'error', (err) ->
      console.error err
    .pipe source 'index.js'
    .pipe buffer()
    .pipe uglify()
    .pipe gulp.dest './public'
    .pipe gif '*.js', reload()

gulp.task 'jade', ->
  gulp.src paths.jade
    .pipe jade()
    .pipe gulp.dest './public'
    .pipe reload()

gulp.task 'vendor', ->
  gulp.src paths.vendor
    .pipe gulp.dest './public/vendor'
    .pipe reload()

gulp.task 'images', ->
  gulp.src paths.images
    .pipe gulp.dest './public/images'
    .pipe reload()

gulp.task 'fonts', ->
  gulp.src paths.fonts
    .pipe gulp.dest './public/fonts'
    .pipe reload()

gulp.task 'watch', (cb) ->
  reload.listen()
  bundler.on 'update', gulp.parallel 'coffee'
  autowatch gulp, paths
  cb()


gulp.task 'static', gulp.parallel 'jade', 'images'
gulp.task 'default', gulp.parallel 'coffee', 'static', 'server', 'watch', 'fonts'
