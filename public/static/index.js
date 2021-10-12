function console_form(){
    var formdata = new FormData($("#form1")[0]);
    console.log(formdata)
    
    console.log($('#form1').serialize())
    
}