var concat = require('gulp-concat'),
    del = require('del'),
    gulp = require('gulp'),    
    rename = require('gulp-rename'),
    sass = require('gulp-ruby-sass'),
    uglify = require('gulp-uglify');

var name = 'fleegle.js',
    src = 'src',
    build = 'build',
    js_src = src + '/*.js',
    sass_src = src + '/*.scss';

gulp.task('default', ['clean', 'js', 'sass']);

gulp.task('js', function() {
  return gulp.src(js_src)
    .pipe(concat(name))
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



