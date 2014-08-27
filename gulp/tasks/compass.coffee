gulp = require("gulp")
compass = require("gulp-compass")
sourceFolders = ["src"]
module.exports = ->
  console.log "Something changes in scss"
  gulp.task "compass", ->
    sourceFolders.forEach (folder) ->
      gulp.src(folder + "/scss/*.scss").pipe(compass(
        style: "compressed"
        sass: folder + "/scss"
        css: folder + "/css"
      )).pipe gulp.dest(folder + "/css")
      return

    return

