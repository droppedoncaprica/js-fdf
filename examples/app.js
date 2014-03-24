var fs = require('fs');
var childPrc = require('child_process');
var fdf = require(__dirname + '/../index.js');

var fdfData = fdf.generate({
  'name' : {
    'first' : "Albert",
    'last' : 'Engelbrecht'
  },
  'age' : "Old Enough"
});

fs.writeFile(__dirname + "/test.fdf", fdfData, function(e) {
  if (e) throw e;

  var fillProc = childPrc.spawn('pdftk', ['test.pdf', 'fill_form', 'test.fdf', 'output', 'filled-test.pdf']);

  fillProc.on('close', function(exitCode) {
    if( !exitCode ) {
      console.log('Open filled-test.pdf in your /examples folder to view completd pdf.');

    } else {
      throw new Error("Shit broke, yo!");
    }
  });
});