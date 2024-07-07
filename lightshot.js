function save(){
    screenSaver.copyAndSave(mwImage.source);
}

function saveAs(){
    // cancel
    dialog.fileSave.rejected.connect(()=>{return})
    // accept
    dialog.fileSave.accepted.
    connect(()=>{
                let url = new URL(dialog.fileSave.selectedFile);
                //remove "file://"
                let path = url.pathname;

                if(path.toString() !== "")
                    screenSaver.copyAndSave(mwImage.source, path);
                return;
            })

    dialog.fileSave.open();
}

function selectRect() {
    flag = true
    mainWindow.hide();
    rectTimer.start();
}

function selectIrregular(){
    flag = false
    // mainWindow.visible=false;
    mainWindow.hide();
    rectTimer.start();
}

function fullScreen(){
    screenSaver.saveFullScreen(mainWindow);
}

// SelectionRect's function

function setPropagation(hovered){
    if(hovered)
        selectHandler.enabled = false;
    else
        selectHandler.enabled = true;
}

function updateSize(StartP, endP){
    var minX = Math.min(StartP.x,endP.x);
    var minY = Math.min(StartP.y,endP.y);
    var maxX = Math.max(StartP.x,endP.x);
    var maxY = Math.max(StartP.y,endP.y);
    rect.x = minX;
    rect.y = minY;
    rect.width = maxX-minX;
    rect.height = maxY-minY;

    drawCanvas.requestPaint();
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
