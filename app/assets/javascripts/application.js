// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (	`) for details
// about supported directives.
//
// = require jquery
// = require jquery_ujs
// = require turbolinks
// = require_tree .
// = require bootstrap-sprockets
// = require select.js

$( document ).ready(function() {
	if($('#transaction_transaction_type').val() == "transfer")
			$("#to_account_id").show();
	else if ($('#transaction_transaction_type').val() == "insert" || $(this).val() == "delete" || $(this).val()== "")
		$("#to_account_id").hide();
	$('#transaction_transaction_type').on('click', function(){
				if($(this).val() == "transfer")
					$("#to_account_id").show();
				else if ($(this).val() == "insert" || $(this).val() == "delete" || $(this).val()== "")
					$("#to_account_id").hide();
	});
	
});
$( document ).ready(function() {
	$('.create_account').on('click', function(){
					$("#new_account").show();
	});
	
});

$( document ).ready(function() {
	if($('#transac_search_type').val() == "Accounts"){
			$("#from_account_id").show();
			$("#tag_type").hide();
	}
	else if ($('#transac_search_type').val() == "Tags"){
		$("#tag_type").show();
		$("#from_account_id").hide();
	}
	$('#transac_search_type').on('click', function(){
				if($(this).val() == "Accounts"){
							$("#from_account_id").show();
								$("#tag_type").hide();
				}
				else if ($(this).val() == "Tags"){
						$("#tag_type").show();
						$("#from_account_id").hide();
				}
	});
	
});