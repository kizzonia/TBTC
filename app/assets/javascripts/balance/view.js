

var view = (function() {

  var $btnNewTrans;
  var $transModal;
  var $btnSave;
  var $inputAmount;
  var $selectTrans;
  var $parameters;
 var accountId  = $('#params').text();
  var $notification;
  var url = "/api/v1/accounts/new_transaction";
// set the above variables  to  their corresponing id
  var fetchElements = function() {
    $btnNewTrans      = $("#btnTrans");
    $transModal      = $("#trans-modal");
    $btnSave         = $("#btnSave");
    $inputAmount     = $("#inputAmount");
    $selectTrans     = $("#selectTrans");
    $parameters        = $("#parameters");
    $notification =    $(".notification");

     var accountId  = $('#params').text();
  };
  //disable controlls if user inputs
  var disableControls  = function(){
    $btnSave.prop("disabled", true);
    $selectTrans.prop ("disabled", true);
    $inputAmount.prop ('disabled', true);

  };

//   enable controlss afteer an error
  var enableControls = function(){
    $btnSave.prop("disabled", false);
    $selectTrans.prop ("disabled", false);
    $inputAmount.prop ('disabled', false);

  }


  var initializeEvents = function() {
    $btnNewTrans.on("click", function() {
      $transModal.modal("show");
    // button save
      $btnSave.on('click', function() {
        //get values from forms
        var amount      = $inputAmount.val();
        var transaction_type = $selectTrans.val();


        disableControls();

        console.log("Amount:" + amount + "transaction_type :"+ transaction_type  +  "  account_id:" + accountId );
          $notification.html("");
        $.ajax({
                url: url,
                method: "POST",
                dataType: "json",
                data: {
                    amount: amount,
                    transaction_type: transaction_type,
                    account_id: accountId
                },
                success: function(response) {
                    window.location.href = "/accounts/" + accountId;
                },
                error: function(response) {
                    $notification.html(JSON.parse(response.responseText).errors.join());
                }



      })
    });
    });
  };



  var init = function() {
    fetchElements();
    initializeEvents();
  };

  return {
    init: init

  };
})();
