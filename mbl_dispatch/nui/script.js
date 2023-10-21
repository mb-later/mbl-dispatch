window.addEventListener("message", function (event) {
    switch(event.data.action) {
        case 'showNotification':
            ProcessNotification(event.data.content);
            break;
    }
});

function ProcessNotification(notif) {

    var randomidver = Math.floor((Math.random() * 1000000) + 1);
    $('#emergencyNotifications').append('<div class="toast m-1 " id="' + randomidver + '" style="width:300px; padding-right:30px; padding-left:10px; " role="alert" aria-live="assertive" aria-atomic="true" data-autohide="true" data-delay="10000">  <div class="row"><div class="col-10 text-white"><span class="badge badge-danger">' + notif.code + '</span> <span class="badge badge-info">' + notif.codeText + '</span><br>' + notif.message + '</div><div class="col-2 text-center my-auto"><i class="' +notif.icon+ '" fa-2x p-2 text-white"></i></div></div>  </div>');
    $('#'+randomidver).toast('show')
}

$('.toast').toast();
