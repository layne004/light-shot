function selectRect() {
    mainWindow.hide();
    rectTimer.start();
}

function windowUnderCursor(){

}



// SelectionRect's function

function updateSize(StartP, endP){
    var minX = Math.min(StartP.x,endP.x);
    var minY = Math.min(StartP.y,endP.y);
    var maxX = Math.max(StartP.x,endP.x);
    var maxY = Math.max(StartP.y,endP.y);
    rect.x = minX;
    rect.y = minY;
    rect.width = maxX-minX;
    rect.height = maxY-minY;
}

function isInArea(pos){
    var minX = rect.x;
    var minY = rect.y;
    var maxX = rect.x+rect.width;
    var maxY = rect.y+ rect.height;
    if(pos.x>=minX&&pos.x<=maxX&&pos.y>=minY&&pos.y<=maxY){
        return true;
    }
    else{
        return false;
    }
}
