gulp        = require('gulp')
browserSync = require('browser-sync')
changed     = require('gulp-changed')
imagemin    = require('gulp-imagemin')
config      = require('../config').images

gulp.task 'images', ->
  gulp.src(config.src)
    .pipe(changed(config.dest))
    .pipe(imagemin())
    .pipe(gulp.dest(config.dest))
    .pipe(browserSync.reload(stream: true))
