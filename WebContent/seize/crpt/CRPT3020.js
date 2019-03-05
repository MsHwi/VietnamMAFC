
 // ***********************************************************************************************
 // Program Name : [CRPT3020] COORDINATOR'S PERFORMANCE [DC TO-BE]
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2018. 03. 19
 // Description  : COORDINATOR'S PERFORMANCE
 // Modify Desc  : 
 // -----------------------------------------------------------------------------------------------
 // Date         | Updater        | Remark
 // -----------------------------------------------------------------------------------------------
 //     
 //        
 // ***********************************************************************************************/

corebase.wrapping("#CRPT3020", function($cbwrap, $cbfind, corebase) {
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
	        gfn_checkDatePicker($cbfind("#DIV_SRCH #SRCH_STR_DT"), $cbfind("#DIV_SRCH #SRCH_END_DT"), $cbfind(this).cbVal());
	    });
	    
	});
	
	
	// Initialize Function
	function fn_init() {
	    gfn_setCntrOrg($cbfind("#DIV_SRCH"), "TEAM");
	}
	
	// Search function
	function fn_srch() {
		// Check date
	    if( !CBDate.isValidDate($("#SRCH_STR_DT").cbVal()) ) {
            CBMsg.error(cb.locMessage("msg.76", "Please enter the date with the standard format."));
            $("#SRCH_STR_DT").focus();
            return;
        }
		
		var source = {};
		source = corebase.getSource("#DIV_SRCH");
	    source = $cbfind("#GRD_RPT").cbSpread().getPageSource(source); // Grid Page Source
	    
	    corebase.selectList ( source, "CRPT3020.SELECT_EMPTY_LIST", function ( output, metadata ){
	        $cbfind("#GRD_RPT").cbSpread().cbBindData(output, metadata); // page (cbSpread() and metadata Add)
	    });
	}
	
	// File export function
	function fn_exptFile(type) {
		// Check date
	    if( !CBDate.isValidDate($("#SRCH_STR_DT").cbVal()) ) {
            CBMsg.error(cb.locMessage("msg.76", "Please enter the date with the standard format."));
            $("#SRCH_STR_DT").focus();
            return;
        }
	    
	    if(!cb.confirm(type == "exportExcel" ? cb.locMessage("msg.257", "Do you want export Excel file?") : cb.locMessage("msg.1657", "Do you want export PDF file?"))) return;
	    
	    var options = {};
	    var data= {};
	    var source = {};
	    
	    source = corebase.getSource("#DIV_SRCH");
	    
	    var detail = [];
	    detail.push(cb.locMessage("txt.1326", "Query Period") + " : " + $cbfind("#DIV_SRCH #SRCH_STR_DT").cbText() + " ~ " + $cbfind("#DIV_SRCH #SRCH_END_DT").cbText());
	    detail.push(cb.locMessage("txt.972", "Organization") + " : " + $cbfind("#DIV_SRCH #CMB_CNTR_CD").cbText() + " / " + $cbfind("#DIV_SRCH #CMB_GRP_CD").cbText() + " / " + $cbfind("#DIV_SRCH #CMB_TEAM_CD").cbText());
	    
	    var header = {};
	    header.exportParam = {};
	    header.exportParam.programId = GV_PGM.programId;
	    header.exportParam.fileName = gfn_getProgramTitle(GV_PGM.programId, "_") + "_" + CB.today();
	    header.exportParam.title = gfn_getProgramTitle(GV_PGM.programId);
	    header.exportParam.strDate = $cbfind("#DIV_SRCH #SRCH_STR_DT").cbText();
	    header.exportParam.endDate = $cbfind("#DIV_SRCH #SRCH_END_DT").cbText();
	    header.exportParam.format = "pdf";
	    header.exportParam.target = $cbwrap.cbSpread("#GRD_RPT");
	    header.exportParam.detail = detail;
	    
	    data.SELECT_EMPTY_LIST = corebase.Input("selectList", "CRPT3020.SELECT_EMPTY_LIST", source, header); // select query
	    
	    options.method = type;//"exportExcel", "exportReport";
	    options.data = data;
	    
	    corebase.ajax(options);
	}
});