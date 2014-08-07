var gulp = require('gulp');

module.exports = function(done) {
	gulp.watch(['src/**/*.js'], ['copy']);
};