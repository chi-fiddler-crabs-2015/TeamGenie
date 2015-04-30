$(document).ready(function() {

  $(document).on('click', '.edit-amount-owed', function(e) {
    e.stopPropagation();
  });

  $('.edit-amount-owed').click(function(e) {
    var confirmNewPayment = window.confirm("Are you sure you want to reset this players dues?");
    if (confirmNewPayment == false) {
      e.preventDefault();
    };
  });

  $(document).on('click', '.mark-paid', function(e) {
    e.preventDefault();

    var form = $(this).parent();

    $.ajax({
      url: form.attr('action'),
      method: 'put',
      data: form.serialize(),
      dataType: 'html',
      success: function(response) {
        // console.log(response);
        $(form.parent()).html(response)},
      error: function(response) {
          console.log(response);
        }
    });

  });

  $(document).on('click', '.mark-unpaid', function(e) {
    e.preventDefault();

    var form = $(this).parent();

    $.ajax({
      url: form.attr('action'),
      method: 'put',
      data: form.serialize(),
      dataType: 'html',
      success: function(response) {
        // console.log(response);
        $(form.parent()).html(response)},
      error: function(response) {
          console.log(response);
        }
    });

  });

$(document).on('click', '.remove-player', function(e) {
    e.stopPropagation();
  });

$('.remove-player').on('click', function(e) {
  console.log('clicked')
    var confirmDelete = window.confirm("Are you sure you want to delete this player?");
    if (confirmDelete == false) {
      e.preventDefault();
    };

  });

  $(document).on('click', '.member', function() {
    var activePlayerId = this.id

    $(this).toggleClass('active-player');
    $(this).find('.edit-amount-owed').toggleClass('hidden');
    $(this).find('.remove-player').toggleClass('hidden');
    $(this).find('.mark-unpaid').toggleClass('hidden');
    $(this).find('.mark-paid').toggleClass('hidden');
    $(this).find('.amount-owed-div').toggleClass('display-none');
    $(this).find('.mark-paid-div').toggleClass('display-none');
    $(this).find('.mark-unpaid-div').toggleClass('display-none');

    });


    // $(this).on('click', '.mark-paid', function(e){
    //   e.preventDefault();
    //   console.log(this)
    // });
    // console.log(activePlayerId)




});