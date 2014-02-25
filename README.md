fdf.js
======

This is an FDF (Form Data Format) generator for Node.js.
FDF is a format you can use to populate Adobe PDF forms. 

Installing
----------
````
 npm install fdf.js --save
````

Usage
-----
````javascript
var fdf = require('fdf.js')
  , fs = require('fs');

var data = fdf.generate({
  name: 'Batman',
  type: 'Superhero'
});

fs.writeFile('data.fdf', data);
````

A typical way to use the resulting fdf is to auto-fill a PDF form:

````
pdftk form.pdf fill_form data.fdf output <outputFileName>
````

This will populate form.pdf with the values.

Flattening
----------

If you are passing in complex objects, they will be flatted when setting the FDF data names.  See [object-iron](https://github.com/droppedonjapan/object-iron) for more details.

See Also
--------
 - fdfgen - in Python - https://github.com/ccnmtl/fdfgen
 - koivi createPDF - in PHP - http://koivi.com/fill-pdf-form-fields/tutorial.php
