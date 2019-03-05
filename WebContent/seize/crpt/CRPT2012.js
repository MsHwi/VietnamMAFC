 // ***********************************************************************************************
 // Program Name : [CRPT2012] I/B Weekly Call Report Script
 // Creator      : jekalhg@buttle.co.kr
 // Create Date  : 2018. 03. 14
 // Description  : I/B Weekly Call Report
 // Modify Desc  : 
 // -----------------------------------------------------------------------------------------------
 // Date         | Updater        | Remark
 // -----------------------------------------------------------------------------------------------
 //     
 //        
 // ***********************************************************************************************/
corebase.wrapping("#CRPT2012", function($cbwrap, $cbfind, corebase) {
	
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
	        fn_checkDatePicker($cbfind("#DIV_SRCH #SRCH_STR_DT"), $cbfind("#DIV_SRCH #SRCH_END_DT"), $cbfind(this).cbVal());
	    });
	    
	    fn_setDate(CB.today());	    
	    $cbfind("#SRCH_STR_DT, #SRCH_END_DT").change(function(){	    
	    	fn_setDate($(this).cbVal());	    	
	    });

//	    // 날짜 컬럼의 Template 변환(숫자형태면 날짜포멧으로 설정, 아니면 Total로 설정)
//	    var columns = $cbwrap.cbSpread("#GRD_RPT").options().columns;
//	    columns[1].template = function(model) {
//	    	if (CBData.isNumber(model.DT)) {
//	    		return CBDate.formatDate(model.DT);
//	    	}
//	    	
//	    	return cb.locMessage("txt.1282", "Total");
//	    };
//	    $cbwrap.cbSpread("#GRD_RPT").options({ columns : columns });
	});
	
	// Initialize Function
	function fn_init() {
	    gfn_setCntrOrg($cbfind("#DIV_SRCH"), "CNTR");
	}
	
	// Search function
	function fn_srch() {
		// Check date
	    if(!gfn_validDate($cbfind("#DIV_SRCH #SRCH_STR_DT").cbVal(), $cbfind("#DIV_SRCH #SRCH_END_DT").cbVal(), "Y", "31") ){
	        return;
	    }
		
//		var source = {};
//		source = corebase.getSource("#DIV_SRCH");
//	    source = $cbfind("#GRD_RPT").cbSpread().getPageSource(source); // Grid Page Source
//
//	    corebase.select(source, "CRPT2012.SELECT_WKLY_CALL", function(output, metadata) {
//	    	$cbfind("#WKLY_CALL_TOT").cbBindData(output);
//	    });
//
//		var source2 = {};
//		source2 = corebase.getSource("#DIV_SRCH");
//	    source2 = $cbfind("#GRD_RPT").cbSpread().getPageSource(source); // Grid Page Source
//
//	    corebase.selectList ( source2, "CRPT2012.SELECT_WKLY_CALL_DETL", function (output, metadata){
//	        $cbfind("#GRD_RPT").cbSpread().cbBindData(output, metadata); // page (cbSpread() and metadata Add)
//	    });
//	    
	    
		var option = {};
		var data   = {};
		var source = {};
		source = corebase.getSource("#DIV_SRCH");
	    source = $cbfind("#GRD_RPT").cbSpread().getPageSource(source); // Grid Page Source
	    
		data.SELECT_WKLY_CALL = corebase.Input("select", "CRPT2012.SELECT_WKLY_CALL", source); // Search Weekly Call Total
		data.SELECT_WKLY_CALL_DETL = corebase.Input("selectList", "CRPT2012.SELECT_WKLY_CALL_DETL", source); // Search Weekly Call Detail  
		
		option.data = data;

		corebase.ajax(option, function (output, metadata) {
			$cbfind("#WKLY_CALL_TOT").cbBindData(output.SELECT_WKLY_CALL);
			$cbfind("#GRD_RPT").cbSpread().cbBindData(output.SELECT_WKLY_CALL_DETL, metadata.SELECT_WKLY_CALL_DETL);			
	    });
		
	}
	
	// File export function
	function fn_exptFile(type) {
	    
	    if (!gfn_validDate($cbfind("#DIV_SRCH #SRCH_STR_DT").cbVal(), $cbfind("#DIV_SRCH #SRCH_END_DT").cbVal(), "Y", "31")) {
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
	    header.exportParam.team = $cbfind("#DIV_SRCH #CMB_CNTR_CD").cbText() + " / " + $cbfind("#DIV_SRCH #CMB_GRP_CD").cbText() + " / " + $cbfind("#DIV_SRCH #CMB_TEAM_CD").cbText();
	    header.exportParam.format = "pdf";
	    header.exportParam.target = $cbwrap.cbSpread("#GRD_RPT");
	    header.exportParam.detail = detail;
	    
	    data.SELECT_WKLY_CALL_DETL = corebase.Input("selectList", "CRPT2012.SELECT_WKLY_CALL_DETL", source, header); // select query
	    
	    options.method = type;//"exportExcel", "exportReport";
	    options.data = data;
	    
	    corebase.ajax(options);
	}
	
	// datepicker from~to setting
	function fn_checkDatePicker(dtpFrom, dtpTo, type) {
		var today = CB.today();
    	var d = new Date(today.substring(0,4)+'/'+today.substring(4,6)+'/'+today.substring(6,8));	    
	    var day = d.getDay();
	    var diffSun = d.getDate() - day + 7;    	
    	var sunday = new Date(d.setDate(diffSun)); 
    	sunday=CB.toTimeString(sunday);
		
	    switch (type) {
	    case "W" :
	        dtpFrom.cbVal(CBDate.dateAdd("d", -6, sunday, CB.dateformat("today")));//"yyyymmdd"));
	        dtpTo.cbVal(CBDate.dateAdd("d", 0, sunday, CB.dateformat("today")));//"yyyymmdd"));
	        break;
	    case "M" :
	        dtpFrom.cbVal(CBDate.dateAdd("d", -13, sunday, CB.dateformat("today")));//"yyyymmdd"));
	        dtpTo.cbVal(CBDate.dateAdd("d", -7, sunday, CB.dateformat("today")));//"yyyymmdd"));
	        break;
	    default :
	        CBMsg.error(cb.locMessage("msg.295", "You entered a wrong information."));
	    } 
	}
	
	// set dates as monday and sunday of the picked week
	function fn_setDate(date){
		
    	var d = new Date(date.substring(0,4)+'/'+date.substring(4,6)+'/'+date.substring(6,8));	    
	    var day = d.getDay();
	    var diffSun = d.getDate() - day + 7;    	
    	var sunday = new Date(d.setDate(diffSun)); 
    	sunday=CB.toTimeString(sunday);

    	var monday = CBDate.dateAdd("d", -6, sunday, CB.dateformat("today"));
    	var sunday = CBDate.dateAdd("d", 0, sunday, CB.dateformat("today"));
    	$cbfind("#SRCH_STR_DT").cbVal(monday);
    	$cbfind("#SRCH_END_DT").cbVal(sunday);
	}
	
});