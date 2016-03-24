// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .
//= require_tree ./../../../vendor/assets/javascripts

// TODO: figure out how to make sweetalerts work!
// $(function() {
//   console.log('doc ready')
//   $("#delete-image").on('click', function(e) {
//     console.log('clicked')
//     e.preventDefault();
//
//     var link = this;
//
//     swal({
//       title: 'Are you sure?',
//       text: 'You will not be able to recover this imaginary file!',
//       type: 'warning',
//       showCancelButton: true,
//       confirmButtonColor: '#DD6B55',
//       confirmButtonText: 'Yes, delete it!',
//       cancelButtonText: 'No, cancel plx!',
//       closeOnConfirm: false,
//       closeOnCancel: false
//     }, function(confirmed) {
//       if (confirmed) {
//         $.ajax({
//           url: $(link).attr("href"),
//           dataType: "JSON",
//           method: "DELETE"
//         });
//       } else {
//         console.log('nope');
//       }
//     });
//     return
//   });
// });
