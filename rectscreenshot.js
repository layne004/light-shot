
// CaptureWindow's function
function finalSave(){
    if(selectRect.modeValue === modeResize
            && selectRect.modeValue === modeDrag)
        saver.saveImageToClip(cw_image, rectSize);
    else{
        saver.saveCanvasToClip(cw_image, selectRect.pencilCanvas, rectSize);
    }
    temp = saver.tempPath;
}

function acceptAction(){
    finalSave();
    captureWindow.close();
}

function pinAction(){
    finalSave();
    captureWindow.hide();
    pinloader.source = "PinWindow.qml"
    pinWindow.x = selectArea.x;
    pinWindow.y = selectArea.y;
    pinWindow.width = selectArea.width;
    pinWindow.height = selectArea.height + 5;
    pinWindow.pinImg.source = "file://"+temp;
    pinWindow.show();
}


