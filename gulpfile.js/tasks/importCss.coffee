gulp         = require('gulp')
cssimport    = require('gulp-cssimport')
rename       = require('gulp-rename')
config       = require('../config').importCss

gulp.task 'importCss', ->
  gulp.src(config.src)
    .pipe(cssimport(config.settings))
    .pipe(rename(config.name))
    .pipe(gulp.dest(config.dest))
