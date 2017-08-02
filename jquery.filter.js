// Copyright (c) 2010 Kilian Valkhof

// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use,
// copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following
// conditions:

// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.


(function ($) {

  // custom css expression for a case-insensitive contains()
  jQuery.expr[':'].Contains = function(p, i, m) {
    return (p.textContent || p.innerText || "").toLowerCase().indexOf(m[3].toLowerCase()) >= 0;
  };

  function listFilter(inputBox, list) { // header is any element, list is an unordered list
    $(inputBox)
      .change( function () {
        var filter = $(this).val();
        if (filter) {
          // this finds all paragraphs in a list that contain the input,
          // and hide the ones not containing the input while showing the ones that do
          $(list).find("p:not(:Contains(" + filter + "))").parent().slideUp();
          $(list).find("p:Contains(" + filter + ")").parent().slideDown();
          $("#search_clear_button").prop('disabled', false);
        } else {
          $(list).find("div").slideDown();
          $("#search_clear_button").prop('disabled', true);
        }
        return false;
      })
      .keyup( function () {
        // fire the above change event after every letter
        $(this).change();
      });
  }

  // ondomready
  $(function () {
    listFilter($("#search_input"), $("#container"));
  });
}(jQuery));
