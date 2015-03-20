gulp         = require('gulp')
gulpSequence = require('gulp-sequence')

gulp.task 'build', gulpSequence(
  'clean'
  ['iconFont', 'images']
  ['scripts', 'styles']
  ['jade', 'copy'])
