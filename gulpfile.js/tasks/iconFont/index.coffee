gulp             = require('gulp')
iconfont         = require('gulp-iconfont')
generateIconSass = require('./generateIconSass')
config           = require('../../config').iconFont

gulp.task 'iconFont', ->
  gulp.src(config.src)
    .pipe(iconfont(config.options))
    .on('codepoints', generateIconSass)
    .pipe(gulp.dest(config.dest))
