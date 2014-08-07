var gulp = require('gulp');

module.exports = function() {
	return gulp
		.src(['src/**/*.js'])
		.pipe(gulp.dest('demo/bossy'));
};