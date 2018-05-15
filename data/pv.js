
function main () {

    $("#cmd-breaks").click(function(){                    
        label = $(this).html()
        if (label == 'Show breaks') {
            // Show breaks
            $('.break').show()                        
            $(this).html('Hide breaks');
        } else {
            // Hide breaks
            $('.break').hide()
            $(this).html('Show breaks');
        }                
    })
    
}
