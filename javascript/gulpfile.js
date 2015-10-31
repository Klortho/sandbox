var gulp = require('gulp');
var concat = require('gulp-concat');

gulp.task('scripts', function() {
  return gulp.src('src/js/*.js')
    .pipe(concat('fleegle.js'))
    .pipe(gulp.dest('build/js'));
});

 // Default Task
gulp.task('default', ['scripts']);
