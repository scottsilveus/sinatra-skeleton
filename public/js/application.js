$(document).ready(function() {
	// FORM VALIDATOR
	$("#create").on('submit',function(event){
    event.preventDefault();
    $('#errors').empty();
    var errors = []
    var reEmail = /.+[@].+[.].+/;
    var charCheck = /.{8,}/;
    var capCheck = /[A-Z]/;
    var numCheck = /\d/;
    var emailToCheck = ($('form').find("[name='email']").val());
    var password = ($('form').find("[name='password']").val());
    if (!reEmail.exec(emailToCheck)){
        errors.push('<li>Must be a valid email.</li>');
    }
    if (!charCheck.exec(password)) {
      errors.push('<li>Password must have at least 8 characters</li>');
    }
    if (!capCheck.exec(password)) {
      errors.push('<li>Password must have at least one capital letter.</li>');
    }
    if (!numCheck.exec(password)) {
      errors.push('<li>Password must have at least one numeric character (0-9).</li>');
    }
    if (errors.length > 0) {
    	for (var i in errors ){
    		$('#errors').append(errors[i]);
    	}
    }
  });//END FORM VALIDATION

  
});
