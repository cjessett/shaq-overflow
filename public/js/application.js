$(document).ready(function() {
// BEGIN validation function
  function IsEmpty(password_input, username_input) {
    if (password_input.length < 2 || username_input.length < 2) {
      alert("To get the most outta Shaq, please fill out username and password fields");
      return false;
    } else {
      // Allow login to happen
      return true;
    };
  };

  $('form').on('submit', function(event){
    event.preventDefault()

    var loginData = $(this).serialize()

    $.ajax({
          method: 'POST',
          url: '/',
          data: loginData,
          dataType: 'JSON'

// if done, validate the forms to make sure they are not empty (currently returns T or F)
    }).done(function(){
      if (IsEmpty(password, username)){
// render the login page
      };
  });
});
