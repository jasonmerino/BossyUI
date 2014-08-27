gulp = require("gulp")
config = require("../config")
module.exports = ->
  gulp.watch config.paths.scss, ["compass"]
  gulp.watch config.paths.css, ["copy"]
  gulp.watch config.paths.scripts, ["copy"]
  gulp.watch config.paths.scripts, ["build"]
  return
