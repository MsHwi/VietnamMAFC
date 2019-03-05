 // ***********************************************************************************************
 // Program Name : [CRPT1020] Lead Send to DC / SIP Admin Report
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2018. 03. 14
 // Description  : TopUp Report
 // Modify Desc  : 
 // -----------------------------------------------------------------------------------------------
 // Date         | Updater        | Remark
 // -----------------------------------------------------------------------------------------------
 //     
 //        
 // ***********************************************************************************************/
corebase.wrapping("#CRPT1020", function($cbwrap, $cbfind, corebase) {
	
	// document ready
	$(document).ready(function() {

		// Grid Paging
		$("#GRD_RPT").cbSpread().pagesearch(fn_srch);
		
		// Check date period
        $("input[name='SRCH_RD_DT']").change(function () {
        	gfn_checkDatePicker($("#DIV_SRCH #SRCH_STR_DT"), $("#DIV_SRCH #SRCH_END_DT"), $(this).cbVal());
        });
    	
    	// Button Click 
        $("#BTN_SRCH").click(fn_srch); // Search Button
     	$("#BTN_EXCEL").click(function() { // Excel download Button
        	fn_exptFile("exportExcel");
        });
        $("#BTN_PDF").click(function() { // PDF download Button
        	fn_exptFile("exportReport");
        }); 
    });
    
	// Search function
    function fn_srch() {
    	
		// Check date
	    if(!gfn_validDate($cbfind("#DIV_SRCH #SRCH_STR_DT").cbVal(), $cbfind("#DIV_SRCH #SRCH_END_DT").cbVal(), "Y", "31") ){
	        return;
	    }
		
		var source = {};
		source = corebase.getSource("#DIV_SRCH");
	    source = $cbfind("#GRD_RPT").cbSpread().getPageSource(source); // Grid Page Source
	    
	    corebase.selectList ( source, "CRPT1020.SELECT_LEAD_DC_SIP_ADMN", function ( output, metadata ){
	        $cbfind("#GRD_RPT").cbSpread().cbBindData(output, metadata); // page (cbSpread() and metadata Add)
	    }); 
	}
    
 	// File export function
	function fn_exptFile(type) {
        
		if (!gfn_validDate($("#DIV_SRCH #SRCH_STR_DT").cbVal(), $("#DIV_SRCH #SRCH_END_DT").cbVal(), "Y", "31")) {
            return;
        }
        
		if(!cb.confirm(type == "exportExcel" ? cb.locMessage("msg.257", "Do you want export Excel file?") : cb.locMessage("msg.1657", "Do you want export PDF file?"))) return;
		
    	var options = {};
	    var data= {};
		var source = {};
    	
    	source = corebase.getSource("#DIV_SRCH");
    	
    	var detail = [];
    	detail.push(cb.locMessage("txt.1326", "Query Period") + " : " + $cbfind("#DIV_SRCH #SRCH_STR_DT").cbText() + " ~ " + $cbfind("#DIV_SRCH #SRCH_END_DT").cbText());
    	detail.push(cb.locMessage("txt.1428", "Campaign") + " : " + $cbfind("#DIV_SRCH #CMB_CMP_CD").cbText());
    	detail.push(cb.locMessage("txt.1386", "Status") + " : " + $cbfind("#DIV_SRCH #CMB_STT_CD").cbText());
        detail.push(cb.locMessage("txt.972", "Organization") + " : " + $cbfind("#DIV_SRCH #CMB_CNTR_CD").cbText() + " / " + $cbfind("#DIV_SRCH #CMB_GRP_CD").cbText() + " / " + $cbfind("#DIV_SRCH #CMB_TEAM_CD").cbText());
        detail.push(cb.locMessage("txt.2366", "Router") + " : " + $cbfind("#DIV_SRCH #CMB_RTR_CD").cbText());
        
		var header = {};
		header.exportParam = {};
    	header.exportParam.programId = GV_PGM.programId;
    	header.exportParam.fileName = gfn_getProgramTitle(GV_PGM.programId, "_") + "_" + CB.today();
    	header.exportParam.title = gfn_getProgramTitle(GV_PGM.programId);
    	header.exportParam.strDate = $("#DIV_SRCH #SRCH_STR_DT").cbText();
        header.exportParam.endDate = $("#DIV_SRCH #SRCH_END_DT").cbText();
        header.exportParam.campaign = $cbfind("#DIV_SRCH #CMB_CMP_CD").cbText();
        header.exportParam.team = $cbfind("#DIV_SRCH #CMB_CNTR_CD").cbText() + " / " + $cbfind("#DIV_SRCH #CMB_GRP_CD").cbText() + " / " + $cbfind("#DIV_SRCH #CMB_TEAM_CD").cbText();
        header.exportParam.status = $cbfind("#DIV_SRCH #CMB_STT_CD").cbText();
        header.exportParam.router = $cbfind("#DIV_SRCH #CMB_RTR_CD").cbText();
    	header.exportParam.format = "pdf";
    	header.exportParam.target = $.cbSpread("#GRD_RPT");
    	header.exportParam.detail = detail;
    	
	    data.SELECT_LEAD_DC_SIP_ADMN = corebase.Input("selectList", "CRPT1020.SELECT_LEAD_DC_SIP_ADMN", source, header); // select query
	    
	    options.method = type;//"exportExcel", "exportReport";
	    options.data = data;
	    
	    corebase.ajax(options);
	}
});