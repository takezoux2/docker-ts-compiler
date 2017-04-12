const gulp = require('gulp');
const webpack = require('webpack-stream');
const webpackConfig = require('./webpack.config.js');
const webserver  = require('gulp-webserver');
const runSequence = require('run-sequence');


const TS_SRC = './src/ts/**/*.ts';
const JS_DEST = './dist/js/';

gulp.task('clean', function() {
    del([JS_DEST]);
});

gulp.task('webpack', function () {
    return gulp.src([TS_SRC])
        .pipe(webpack(webpackConfig))
        .pipe(gulp.dest(JS_DEST));
});

gulp.task('serve', () => {
  gulp.src('.')
    .pipe(webserver({
      host: '0.0.0.0',
      port: 80,
      livereload: true,
      open: true
    }));
});

gulp.task('watch', function () {
    gulp.watch(TS_SRC, ['webpack']);
});

gulp.task('default', () => {
  runSequence('watch', 'serve')
});