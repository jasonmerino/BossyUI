gulp = require "gulp"
concat = require "gulp-concat"
sourcemaps = require "gulp-sourcemaps"
config = require "../config"
coffee = require "gulp-coffee"

module.exports = ->
  gulp
    .src config.paths.scripts
    .pipe sourcemaps.init()
    .pipe concat "bossy.all.js"
    .pipe coffee()
    .pipe sourcemaps.write()
    .pipe gulp.dest "build/js"
    .pipe gulp.dest "demo/public/javascripts"
