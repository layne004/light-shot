file(REMOVE_RECURSE
  "lightshot/CaptureWindow.qml"
  "lightshot/MainActions.qml"
  "lightshot/MainButtons.qml"
  "lightshot/MainWindow.qml"
  "lightshot/SelectAreaButtons.qml"
  "lightshot/SelectionActions.qml"
  "lightshot/SelectionRect.qml"
  "lightshot/Windowundercursor_.qml"
  "lightshot/lightshot.js"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/applight-shot_tooling.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
