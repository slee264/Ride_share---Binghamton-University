    `$( function() {
        $( "#search_datepicker" ).datepicker({
            minDate: 0, maxDate: "+3M",
            showOn: "button",
            buttonImage: "assets/calendar.png",
            buttonImageOnly: true,
            buttonText: "Select date"
        });
        
    });`
    
    # $('#search_form_submit').click(
        
    #     (event) ->  
    #             if($('#search_departure').val() == "" || $('#search_destination').val() == ""){
    #                 $('#search_form_submit').attr('data-target', "#myModal");
    #                 event.preventDefault();
    #                 return;
    #             else
    #                 $('#search_form_submit').attr('data-target', "");
    #                 return;
    # )