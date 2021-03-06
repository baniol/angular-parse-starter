// Karma configuration

// base path, that will be used to resolve files and exclude
basePath = '';

// list of files / patterns to load in the browser
files = [
  JASMINE,
  JASMINE_ADAPTER,
  'http://www.parsecdn.com/js/parse-1.2.8.min.js',
  'app/components/angular/angular.js',
  'app/components/angular-mocks/angular-mocks.js',
  'app/components/angular-bootstrap/ui-bootstrap.min.js',
  'app/components/angular-bootstrap/ui-bootstrap-tpls.js',
  'app/components/angular-flash/dist/angular-flash.min.js',
  'app/scripts/*.coffee',
  'app/scripts/**/*.coffee',
  // 'test/mock/**/*.coffee',
  'test/spec/**/*.coffee'
];

// list of files to exclude
exclude = [];

// test results reporter to use
// possible values: dots || progress || growl
reporters = ['progress'];

// web server port
port = 9999;

// cli runner port
runnerPort = 9100;

// enable / disable colors in the output (reporters and logs)
colors = true;

// level of logging
// possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
logLevel = LOG_INFO;

// enable / disable watching file and executing tests whenever any file changes
autoWatch = false;

// Start these browsers, currently available:
// - Chrome
// - ChromeCanary
// - Firefox
// - Opera
// - Safari (only Mac)
// - PhantomJS
// - IE (only Windows)
browsers = ['PhantomJS'];

// If browser does not capture in given timeout [ms], kill it
captureTimeout = 5000;

// Continuous Integration mode
// if true, it capture browsers, run tests and exit
singleRun = false;
