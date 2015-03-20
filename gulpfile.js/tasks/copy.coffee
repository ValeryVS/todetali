gulp        = require('gulp')
browserSync = require('browser-sync')
config      = require('../config').copy

gulp.task 'copy', ->
  gulp.src(config.src)
    .pipe(gulp.dest(config.dest))
    .pipe(browserSync.reload({stream:true}))
