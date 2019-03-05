 // ***********************************************************************************************
 // Program Name : [CRPT1011] O/B Daily Call Report
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2018. 03. 14
 // Description  : O/B Monthly Call Report
 // Modify Desc  : 
 // -----------------------------------------------------------------------------------------------
 // Date         | Updater        | Remark
 // -----------------------------------------------------------------------------------------------
 //     
 //        
 // ***********************************************************************************************/
corebase.wrapping("#CRPT1011", function($cbwrap, $cbfind, corebase) {
	
	corebase.firedInit = function() {
		fn_init();  
	};
	
	// document ready
	$cbfind(document).ready(function() {
			
		$cbfind("#BTN_SRCH").click(fn_srch);
	    $cbfind("#GRD_RPT").cbSpread().pagesearch(fn_srch); // Grid Paging
	    // enter event
	    gfn_setEnter("#DIV_SRCH", fn_srch);
	 	
	    $cbfind("#BTN_EXCEL").click(function() { // Excel download Button
	        fn_exptFile("exportExcel");
	    });
	    $cbfind("#BTN_PDF").click(function() { // PDF download Button
	        fn_exptFile("exportReport");
	    });
	    
	    // Check date period
	    $cbfind("input[name='SRCH_RD_DT']").change(function () {
	        fn_checkDatePicker($cbfind("#DIV_SRCH #SRCH_DT"), $cbfind(this).cbVal());
	    });
	    	    
	});
	
	
	// Initialize Function
	function fn_init() {
	    gfn_setCntrOrg($cbfind("#DIV_SRCH"), "TEAM");
	}
	
	// Search function
	function fn_srch() {
		
		var source = {};
		source = corebase.getSource("#DIV_SRCH");
	    source = $cbfind("#GRD_RPT").cbSpread().getPageSource(source); // Grid Page Source
	    
	    corebase.selectList ( source, "CRPT1011.SELECT_DAILY_CALL", function ( output, metadata ){
	        $cbfind("#GRD_RPT").cbSpread().cbBindData(output, metadata); // page (cbSpread() and metadata Add)
	    }); 
	}
	
	// File export function
	function fn_exptFile(type) {

	    if(!cb.confirm(type == "exportExcel" ? cb.locMessage("msg.257", "Do you want export Excel file?") : cb.locMessage("msg.1657", "Do you want export PDF file?"))) return;
	    
	    var options = {};
	    var data= {};
	    var source = {};
	    
	    source = corebase.getSource("#DIV_SRCH");
	    
	    var detail = [];
	    detail.push(cb.locMessage("txt.1219", "Date") + " : " + $cbfind("#DIV_SRCH #SRCH_DT").cbText());
	    detail.push(cb.locMessage("txt.1428", "Campaign") + " : " + $cbfind("#DIV_SRCH #CMB_CMP_CD").cbText());
	    detail.push(cb.locMessage("txt.972", "Organization") + " : " + $cbfind("#DIV_SRCH #CMB_CNTR_CD").cbText() + " / " + $cbfind("#DIV_SRCH #CMB_GRP_CD").cbText() + " / " + $cbfind("#DIV_SRCH #CMB_TEAM_CD").cbText());
	    
	    var header = {};
	    header.exportParam = {};
	    header.exportParam.programId = GV_PGM.programId;
	    header.exportParam.fileName = gfn_getProgramTitle(GV_PGM.programId, "_") + "_" + CB.today();
	    header.exportParam.title = gfn_getProgramTitle(GV_PGM.programId);
	    header.exportParam.date = $cbfind("#DIV_SRCH #SRCH_DT").cbText();
	    header.exportParam.team = $cbfind("#DIV_SRCH #CMB_CNTR_CD").cbText() + " / " + $cbfind("#DIV_SRCH #CMB_GRP_CD").cbText() + " / " + $cbfind("#DIV_SRCH #CMB_TEAM_CD").cbText();
	    header.exportParam.campaign = $cbfind("#CMB_CMP_CD").cbText();
	    header.exportParam.format = "pdf";
	    header.exportParam.target = $cbwrap.cbSpread("#GRD_RPT");
	    header.exportParam.detail = detail;
	    
	    data.SELECT_DAY_CALL_STS = corebase.Input("selectList", "CRPT1011.SELECT_DAILY_CALL", source, header); // select query
	    
	    options.method = type;//"exportExcel", "exportReport";
	    options.data = data;
	    
	    corebase.ajax(options);
	}
	
	// datepicker setting
	function fn_checkDatePicker(dtp, type) {
		var today = CB.today();
	    switch (type) {
		case "P" :
			dtp.cbVal(CBDate.dateAdd("d", -1, today, CB.dateformat("today")));//"yyyymmdd"));
	        break;
	    case "T" :
			dtp.cbVal(CBDate.dateAdd("d", 0, today, CB.dateformat("today")));//"yyyymmdd"));
	        break;	    
	    default :
	        CBMsg.error(cb.locMessage("msg.295", "You entered a wrong information."));
	    } 
	}
});