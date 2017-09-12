

var view = (function() {

  var $btnNewTrans;
  var $transModal;
  var $btnWith;
  var $withdrawModal;
  var $btnSave
  var $btnSave2;
  var $inputAmount;
  var $selectTrans;
  var $inputAmount2;
  var $selectTrans2;
  var $parameters;
  var $txhash;
  var accountId  = $('#params').text();
  var $notification;
  var url = "/api/v1/accounts/new_transaction";
// set the above variables  to  their corresponing id
  var fetchElements = function() {
    $btnNewTrans     = $("#btnTrans");
    $transModal      = $("#trans-modal");
    $btnSave         = $("#btnSave");
    $btnSave2         = $("#btnSave2");
    $inputAmount     = $("#inputAmount");
    $selectTrans     = $("#selectTrans");
    $inputAmount2     = $("#inputAmount2");
    $selectTrans2     = $("#selectTrans2");
    $parameters      = $("#parameters");
    $notification    = $(".notification");
    $btnWith         = $("#btnWith");
    $withdrawModal   = $("#withdrawModal");
    $txhash          = $("#txhash");

// called the acctId because paramas rails aint calling
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

  $(function(){
    $('#changetabbutton').click(function(e){
    	e.preventDefault();
        $('#mytabs a[href="#second"]').tab('show');
    })

});

  var initializeEvents = function() {
    $btnNewTrans.on("click", function() {
      $transModal.modal("show");
    // button save
      $btnSave.on('click', function() {
        //get values from forms
        var amount           = $inputAmount.val();
        var transaction_type = $selectTrans.val();
        var txhash           = $txhash.val();


        disableControls();

        console.log("Amount:" + amount + "transaction_type :"+ transaction_type  +  "  account_id:" + accountId + "txhash:" + txhash );
          $notification.html("");
        $.ajax({
                url: url,
                method: "POST",
                dataType: "json",
                data: {
                    amount: amount,
                    transaction_type: transaction_type,
                    txhash: txhash,
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

  var initializeSecondEvents = function() {
    $btnWith.on("click", function() {
      $withdrawModal.modal("show");
    // button save
      $btnSave2.on('click', function() {
        //get values from forms
        var amount      = $inputAmount2.val();
        var transaction_type = $selectTrans2.val();

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
   initializeSecondEvents();
  };

  return {
    init: init

  };
})();
