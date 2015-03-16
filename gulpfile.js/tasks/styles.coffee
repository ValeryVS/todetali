gulp         = require('gulp')
gulpSequence = require('gulp-sequence')

gulp.task 'styles', gulpSequence('importCss', 'sass')
