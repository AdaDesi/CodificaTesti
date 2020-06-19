
function ZoomIn(id){
    var img_id="img_"+id;
    document.getElementById(img_id).width=600; 
    document.getElementById(img_id).height=975; 
}

function ZoomOut(id){
    var img_id="img_"+id;
    document.getElementById(img_id).width=400; 
    document.getElementById(img_id).height=600; 
}

var incr = 10;

function RecZoomIn(id){
    alert("prova");
    var img_id="img_"+id;
    document.getElementById(img_id).width += incr;

}

/*
function RecZoomOut(id){
    var img_id="img_"+id;
    var x = document.getElementById(img_id).width;
    var y =document.getElementById(img_id).height;  
}
*/