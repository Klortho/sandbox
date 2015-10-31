var gulp = require('gulp');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var rename = require('gulp-rename');
var sass = require('gulp-ruby-sass');
var del = require('del');

var src = 'src';
var build = 'build';

var js_src = src + '/*.js';
var sass_src = src + '/*.scss';

gulp.task('default', ['clean', 'js', 'sass']);

gulp.task('js', function() {
  return gulp.src(js_src)
    .pipe(concat('fleegle.js'))
    .pipe(gulp.dest(build))
    .pipe(rename({suffix: '.min'}))
    .pipe(uglify())
    .pipe(gulp.dest(build));
});

gulp.task('sass', function() {
  return sass(sass_src, {style: 'compressed'})
    .pipe(rename({suffix: '.min'}))
    .pipe(gulp.dest(build));
});

gulp.task('watch', function() {
  gulp.watch(js_src, ['concat']);
  gulp.watch(sass_src, ['sass']);
});

gulp.task('clean', function () {
  return del([
    'build'
  ]);
});



