console.log("upload.js. ");



var upload = function(sketch, url) {
    console.log(sketch);
    var sender = new UploadCanvas(sketch.externals.canvas, url);
    sender.send(); 
};


function UploadCanvas(canvas, url) {
    this.canvas = canvas;
    this.url = url;

    this.getCanvasData = function() {
        return canvas.toDataURL("image/png");
    };   
    
    this.send = function() {
        /* We'll get this working later.
        var ajax = new XMLHttpRequest();
        ajax.open("POST", this.url, false);
        ajax.onreadystatechange = function() {
            console.log(ajax.responseText);
        }
        ajax.setRequestHeader('Content-Type', 'application/upload');
        ajax.send("imgData="+this.getCanvasData()); 
        */
        $.post(url, {data: this.getCanvasData() });
    };

}


