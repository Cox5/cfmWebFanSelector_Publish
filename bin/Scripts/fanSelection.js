// Java script functions relating to the fan curves and fan table in FanSelection.aspx   


$(document).ready(function () {
  /// <summary>
  /// For ready function.  Puts the fan curve div dimensions in a hidden input to pass to the WS when creating the fan curve.
  /// Sets the mouse over and mouse out functions for the fan table.
  /// </summary>

    $("#body_div_perfCurve_width").val($("#div_performanceCurve").width());
    $("#body_div_perfCurve_height").val($("#div_performanceCurve").height());

    $("#body_div_powerCurve_width").val($("#div_powerCurve").width());
    $("#body_div_powerCurve_height").val($("#div_powerCurve").height());

    var selectedFanID;
       
    if ($("#fanTable tr").length > 1) {
        selectedFanID = $("#body_selectedFanID").val();
        motorID = $(this).attr("#body_hidden_motorid");
        updateFanCurve(selectedFanID, motorID);
    }    

    // Handle Row click, and set #body_selectedFanID value for use in btn_addToSchedule_Click()
    $("#fanTable tr").click(function () {

        selectedFanID = $(this).attr("data-fandataid");
        motorID = $(this).attr("data-motorid");
        pwr = $(this).attr("data-interceptpwr");
        weight = $(this).attr("data-fanweight"); 

        updateFanCurve(selectedFanID, motorID, pwr, weight); // calls GetFanData() in AjaxWS.asmx.cs
        $(this).addClass('selected-tr').siblings().removeClass("selected-tr");
        $("#body_selectedFanID").val(selectedFanID);
    });

    $("#fanTable tr").mouseover(function () {
    });

    $("#fanTable tr").mouseout(function () {
        
    });

    $("#btn_selectAll").click(function () {
        $("#div_ranges :checkbox").attr('checked', true);
    });

    $("#body_btn_clear").click(function () {
      clear();
    });

    $("#body_btnCancel").click(function () {
        window.history.back();
    });

    dialog = $("#printDialog").dialog({
      autoOpen: false,
      height: 200,
      width: 350,
      modal: true,
      buttons: {
        "Print": printDataSheet,
        Cancel: function () {
          dialog.dialog("close");
        }
      },
      close: function () {
        dialog.dialog("close");
      }
    });

    $("#body_btn_print").click(function () {
      dialog.dialog("open");
    });
});

function printDataSheet()
{
  /// <summary>
  /// Print logic for selected fan after Print button has been clicked from dialog
  /// </summary>

  var printOptions = "Wire=" + $("#IncludeWire").prop('checked');
  printOptions += "|Dims=" + $("#IncludeDim").prop('checked');

  $("#body_hf_printOptions").val(printOptions);
    $("#form1").submit();
    alert("Form submitted");
}


function updateFanCurve(fanDataID, motorid, pwr, weight) {
  /// <summary>
  /// Gets the relevant data from the form and sends the data to the web service to create the fan curves
  /// </summary>
  /// <param name="fanDataID">fan data ID</param>

    var airflow = $("#body_txt_airFlow").val(); // requested af
    var staticPressure = $("#body_txt_static").val(); // requested sp
    var addairflow = parseFloat($("#body_txt_percentage").val());

    var divPerfWidth = $("#body_div_perfCurve_width").val();
    var divPerfHeight = $("#body_div_perfCurve_height").val();

    var divPowerWidth = $("#body_div_powerCurve_width").val();
    var divPowerHeight = $("#body_div_powerCurve_height").val();
	
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
    const projectfanid = urlParams.get('ProjectFansID');
    const uid = urlParams.get('uid');
    
    var fanDataOptions = {
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        url: '/AjaxWS.asmx/GetFanData?uid=' + uid + "&fanDataID=" + fanDataID ,
        data: "{ fanDataID:" + fanDataID +
            ", projectfanid:" + parseInt(projectfanid) +
            ", motorid:" + parseInt(motorid) +
            ", weight:" + parseFloat(weight) +
            ", airflow:" + parseFloat(airflow) +
            ", addairflow:" + parseFloat(addairflow) +
            ", staticPressure:" + parseFloat(staticPressure) +
            ", pwr:" + parseFloat(pwr) + // absorbed power at intercept
            ", divPerfWidth:" + parseInt(divPerfWidth) +
            ", divPerfHeight:" + parseInt(divPerfHeight) +
            ", divPowerWidth:" + parseInt(divPowerWidth) +
            ", divPowerHeight:" + parseInt(divPowerHeight) + " }",
        dataType: 'json'
    };

    $.ajax(fanDataOptions).done(getFanDataSucceed);
    document.getElementById("body_hidden_motorid").value = motorid; 
    // document.getElementById("body_hidden_ncc").value = document.getElementById("hidden_ncc").value;
}

//Gets the data of a selected fan
/// @param {fanImageData} fan data ID

function getFanDataSucceed(fanImageData) {
    if ($("#div_fanImage").find("#img_fanImage").length === 0) {
      $("#div_fanImage").append("<img id='img_fanImage' />");
    }

    $("#img_fanImage").attr("src", fanImageData.d.imageLocation);
    $("#div_performanceCurve").html(fanImageData.d.performanceCurve);
    $("#div_powerCurve").html(fanImageData.d.powerCurve);
    $("#div_wiring").html(fanImageData.d.wireElement);
    $("#div_acousticDataTable").html(fanImageData.d.acousticTable);
    $("#div_nominalDataTable").html(fanImageData.d.nominalDataTable);
    $("#div_performanceDataTable").html(fanImageData.d.performanceDataTable);
    $("#div_powerDataTable").html(fanImageData.d.powerDataTable);
    $("#fanName").html(fanImageData.d.fanName);
    $("#div_dimensions_image").html(fanImageData.d.dimsFile);
    $("#div_revit_button").html(fanImageData.d.revitElement);
    $("#div_acad_button").html(fanImageData.d.acadElement);

    document.getElementById('div_fanData').style.visibility = 'visible';
    


    transferActualValues();

    // Populate airflow and st pressure text boxes with given values from datapoint table
    //$("#txt_airFlow").text(fanImageData.d.fanDataID.)
    
}

// Transfer values from selected row to hidden variables
// for use in btn_addToSchedule_Click()
function transferActualValues() {
    // Values come from table in <3> which is populated by AjaxWS.asmx.cs
    let ac_af = $("#ac_af").text();
    let ac_sp = $("#ac_sp").text();
    let ac_sound = $("#ac_sound").text();
    let ac_ov = $("#ac_ov").text();
    let ncc = $("#nccComp").text();
    let abspwr = $("#ac_power").text();

    document.getElementById("body_hidden_ac_af").value = ac_af;
    document.getElementById("body_hidden_ac_sp").value = ac_sp;
    document.getElementById("body_hidden_ac_sound").value = ac_sound;
    document.getElementById("body_hidden_ac_ov").value = ac_ov;
    document.getElementById("body_hidden_ncc").value = ncc;
    document.getElementById("body_hidden_abspwr").value = abspwr;

    document.getElementById("blackdotaf").innerHTML = ac_af;
    document.getElementById("blackdotsp").innerHTML = ac_sp;
    document.getElementById("blackdotap").innerHTML = abspwr;
    document.getElementById("blackdotspl").innerHTML = ac_sound;
    document.getElementById("blackdotspd").innerHTML = "50";
  
   
}

  // Clears all the information on the form and returns it to its default state
function clear()
{
  $("#div_ranges :checkbox").attr('checked', false);

  $("#body_txt_airFlow").val('');
  $("#body_txt_static").val('');
  $("#body_txt_percentage").val('');

  $("#body_div_perfCurve_width").val('');
  $("#body_div_perfCurve_height").val('');

  $("#body_div_powerCurve_width").val('');
  $("#body_div_powerCurve_height").val('');

  $("#body_ddl_fanSpeedMin").val('Any');
  $("#body_ddl_fanSpeedMax").val('Any');

  $("#body_ddl_fanDiameterMin").val('Any');
  $("#body_ddl_fanDiameterMax").val('Any');

  $("#body_ddl_motorPhase").val('Any');
                                                                 
  $('#body_ckb_isBCAComplaint').removeAttr('checked');

  $("#body_div_topLeft").removeClass('afterSelect');
  $("#body_div_bottomLeft").removeClass('afterSelect');
  $("#body_div_hideRight").removeClass('hideAfterSelect');
  $("#body_div_hideBottomLeft").removeClass('hideAfterSelect');
  $("#body_div_hideRight").addClass('hideBeforeSelect');
  $("#body_div_hideBottomLeft").addClass('hideBeforeSelect');
}

function mouseMove(evt) {
  /// <summary>
  /// Moves the blue line around the performance curve
  /// </summary>

    var mouseX = evt.pageX - parseFloat($("#div_performanceCurve").offset().left);

    var circleX = mouseX - 100;

    var xScale = parseFloat(document.getElementById("graph").getAttribute("data-xscale"));
    var yScale = parseFloat(document.getElementById("graph").getAttribute("data-yscale"));

    var maxAirflow = parseFloat(document.getElementById("graphRectangle").getAttribute("width")) / xScale;
    var maxStaticPressure = parseFloat(document.getElementById("graphRectangle").getAttribute("height")) / yScale;

    var airflow = parseFloat(document.getElementById("circle_duty").getAttribute("cx")) / xScale;
    var pressure = parseFloat(document.getElementById("circle_duty").getAttribute("cy")) / yScale;

    var dutyAirflow = circleX / xScale;
    var dutyPressure = pressure / Math.pow(airflow, 2) * Math.pow(dutyAirflow, 2);

    if (dutyAirflow > 0 && dutyAirflow < maxAirflow && dutyPressure > 0 && dutyPressure < maxStaticPressure) {
        document.getElementById("circle_mouse").style.visibility = "visible";
        document.getElementById("bluedotaf").innerHTML = Math.floor(dutyAirflow);
        document.getElementById("bluedotsp").innerHTML = Math.floor(dutyPressure);

        let ac_af = parseFloat($("#ac_af").text());
        let ac_sp = parseFloat($("#ac_sp").text());
        let ac_sound = parseFloat($("#ac_sound").text());
        let ac_abspwr = parseFloat($("#blackdotap").text());

        blue_abs_power = Math.pow(dutyAirflow / ac_af, 3) * ac_abspwr;
        document.getElementById("bluedotap").innerHTML = blue_abs_power.toFixed(2); 

        blue_spl3m = ac_sound + 55 * Math.log10(dutyAirflow / ac_af);
        document.getElementById("bluedotspl").innerHTML = blue_spl3m.toFixed(1); 

        blue_spd = 50 * dutyAirflow / ac_af;
        document.getElementById("bluedotspd").innerHTML = blue_spd.toFixed(0);
        document.getElementById("bluedotnew").innerHTML = "New";

    } else {
        document.getElementById("circle_mouse").style.visibility = "hidden";
        document.getElementById("bluedotaf").innerHTML = "";
        document.getElementById("bluedotsp").innerHTML = "";
        document.getElementById("bluedotspl").innerHTML = "";
        document.getElementById("bluedotspd").innerHTML = "";
        document.getElementById("bluedotap").innerHTML = "";
        document.getElementById("bluedotnew").innerHTML = "&nbsp;"; // to maintain row height
    }

    document.getElementById("circle_mouse").setAttribute("cx", circleX.toString() + "px");
    document.getElementById("circle_mouse").setAttribute("cy", (dutyPressure * yScale).toString() + "px");


}


function mouseOut(evt) {
  /// <summary>
  /// Hides the blue circle
  /// </summary>

    document.getElementById("circle_mouse").style.visibility = "hidden";
}