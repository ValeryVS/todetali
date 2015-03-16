gulp   = require('gulp')
del    = require('del')
config = require('../config')

gulp.task 'clean', (cb) ->
  del [
    config.publicDirectory
    config.tmpDirectory
    config.sourceAssetsGenerated
  ], cb
  return
