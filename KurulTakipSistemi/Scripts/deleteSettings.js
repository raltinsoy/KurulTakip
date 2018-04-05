$( document ).ready( function( )
{
    $( '.delete-row-default' ).bootstrap_confirm_delete(
        {
            callback: function( event )
            {
                var link = event.data.originalObject;

                link.closest( 'tr' ).remove();
            }
        }
    );

    $( '.delete-user-row-with-data-type' ).bootstrap_confirm_delete(
        {
            callback: function( event )
            {
                var link = event.data.originalObject;

                link.closest( 'tr' ).remove();
            }
        }
    );

    $( '.delete-user-row-with-ajax-button' ).bootstrap_confirm_delete(
        {
            callback: function( event )
            {
                $.ajax(
                {
                    url: 'uzerineYaz',
                    dataType: 'text',
                    //type: 'DELETE',
                    data: { id: $(event.data.originalObject).data('deger') }, // data-deger
                    success: function (result) {
                        var button = event.data.originalObject;
                       
                        if( result == false )
                        {
                            $("#hata").hide();
                            $("#hata").text("Silme islemi gerceklestirilemedi.");
                            $("#hata").show("slow");
                            setTimeout(function () {
                                $("#hata").hide("slow");
                            }, 4000);
                        }
                        else
                        {
                            button.closest('tr').remove();
                        }
                        
                    },
                    error: function () {
                        $("#hata").hide();
                        document.getElementById("hata").innerHTML = "Silme islemi gerceklestirilemedi."
                        $("#hata").show("slow");
                        setTimeout(function () {
                            $("#hata").hide("slow");
                        }, 4000);
                        
                    }
                });
            }
        }
    );  

} );

