gulp = require "gulp"
config = require "../config"

module.exports = ->
  gulp
    .src config.paths.scripts.concat config.paths.css
    .pipe gulp.dest "demo/bossy"