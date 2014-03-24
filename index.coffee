# A commonjs, coffeescript FDF generator inspired by Justin Koivisto's "KOIVI HTML Form to FDF Parser for PHP (C) 2004"
# http://koivi.com/fill-pdf-form-fields/tutorial.php
# @author Clark Van Oyen

fs = require "fs"
flatten = require "object-iron"

#   fdf.generate
#   ---------
#   Generates an FDF (Form Data File) from a provided input map from field name to field value.
#
#   @param form      The input map from field name to field value. ie) {name: 'Clark', type: 'superhero'}
#   @result          FDF representation of the form. You will usually write this to a file.
module.exports.generate = (data) ->
    form = flatten(data)

    header = (String.fromCharCode 226) + (String.fromCharCode 227) + (String.fromCharCode 207) + (String.fromCharCode 211)
    data =  """%FDF-1.2
            %#{header}
            1 0 obj
            <<
            /FDF
            <<
            /Fields [
            """

    for field, val of form when form.hasOwnProperty(field)
        data += """<<
                /V(#{val})
                /T(#{field})
                >>
                """

    data += """]
            >>
            >>
            endobj
            trailer

            <<
            /Root 1 0 R
            >>
            %%EOF
            """
    data