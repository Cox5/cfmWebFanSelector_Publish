///
/// JavaScript to handle custom tree of check-boxes widget.
/// Source appears to be: http://stackoverflow.com/questions/10718845/using-javascript-with-treeview-nodes-check-uncheck-functionality/12493806
///

function OnTreeClick(evt) {
  /// <summary>
  /// Handle clicking on the tree.
  /// </summary>
  /// <param name="evt" type="object"></param>

  var src = window.event != window.undefined ? window.event.srcElement : evt.target;
  var isChkBoxClick = (src.tagName.toLowerCase() == "input" && src.type == "checkbox");
  if (isChkBoxClick) {
    var parentTable = GetParentByTagName("table", src);
    var nxtSibling = parentTable.nextSibling;
    if (nxtSibling && nxtSibling.nodeType == 1) //check if next sibling is not null & is an element node
    {
      if (nxtSibling.tagName.toLowerCase() == "div") //if node has children
      {
        //check or uncheck children at all levels
        CheckUncheckChildren(parentTable.nextSibling, src.checked);
      }
    }
    //check or uncheck parents at all levels
    CheckUncheckParents(src, src.checked);
  }
}

function CheckUncheckChildren(childContainer, check) {
  /// <summary>
  /// Check or uncheck all children of a parent check box.
  /// </summary>
  /// <param name="childContainer" type="object" domElement="true"></param>
  /// <param name="check" type="boolean"></param>

  var childChkBoxes = childContainer.getElementsByTagName("input");
  var childChkBoxCount = childChkBoxes.length;
  for (var i = 0; i < childChkBoxCount; i++) {
    childChkBoxes[i].checked = check;
  }
}

function CheckUncheckParents(srcChild, check) {
  /// <summary>
  /// Check or uncheck all parents of a child check box.
  /// </summary>
  /// <param name="srcChild" type="object" domElement="true"></param>
  /// <param name="check" type="boolean"></param>

  var parentDiv = GetParentByTagName("div", srcChild);
  var parentNodeTable = parentDiv.previousSibling;

  if (parentNodeTable) {
    var checkUncheckSwitch;

    if (check) //checkbox checked
    {
      var isAllSiblingsChecked = AreAllSiblingsChecked(srcChild);
      if (isAllSiblingsChecked)
        checkUncheckSwitch = true;
      else
        return; //do not need to check parent if any(one or more) child not checked
    }
    else //checkbox unchecked
    {
      checkUncheckSwitch = false;
    }

    var inpElemsInParentTable = parentNodeTable.getElementsByTagName("input");
    if (inpElemsInParentTable.length > 0) {
      var parentNodeChkBox = inpElemsInParentTable[0];
      parentNodeChkBox.checked = checkUncheckSwitch;
      //do the same recursively
      CheckUncheckParents(parentNodeChkBox, checkUncheckSwitch);
    }
  }
}

function AreAllSiblingsChecked(chkBox) {
  /// <summary>
  /// Check if all of the check boxes at the same level are checked.
  /// </summary>
  /// <param name="chkBox" type="object" domElement="true"></param>
  /// <returns type="boolean"></returns>

  var parentDiv = GetParentByTagName("div", chkBox);
  var childCount = parentDiv.childNodes.length;
  for (var i = 0; i < childCount; i++) {
    if (parentDiv.childNodes[i].nodeType == 1) //check if the child node is an element node
    {
      if (parentDiv.childNodes[i].tagName.toLowerCase() == "table") {
        var prevChkBox = parentDiv.childNodes[i].getElementsByTagName("input")[0];
        //if any of sibling nodes are not checked, return false
        if (!prevChkBox.checked) {
          return false;
        }
      }
    }
  }
  return true;
}

function GetParentByTagName(parentTagName, childElementObj) {
  /// <summary>
  /// Utility function to get the container of an element by tag name.
  /// </summary>
  /// <param name="parentTagName" type="string"></param>
  /// <param name="childElementObj" type="object"></param>
  /// <returns type="object"></returns>

  var parent = childElementObj.parentNode;
  while (parent.tagName.toLowerCase() != parentTagName.toLowerCase()) {
    parent = parent.parentNode;
  }
  return parent;
}