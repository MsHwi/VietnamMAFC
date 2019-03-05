 // ***********************************************************************************************
 // Program Name : [CRPT2010] I/B Daily Call Report Script
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2018. 03. 14
 // Description  : I/B Daily Call Report
 // Modify Desc  : 
 // -----------------------------------------------------------------------------------------------
 // Date         | Updater        | Remark
 // -----------------------------------------------------------------------------------------------
 //     
 //        
 // ***********************************************************************************************/

corebase.wrapping("#CRPT2010", function($cbwrap, $cbfind, corebase){
	corebase.firedInit = function() {
		fn_init();  
	};
	
	// document ready
	$cbfind(document).ready(function() {
		
	    $cbfind("#BTN_SRCH").click(fn_srch);	    
	    
	    // enter event
	    gfn_setEnter("#DIV_SRCH", fn_srch);
	    
	    $cbfind("#GRD_REC_LIST").cbSpread().pagesearch(fn_srch); // Grid Paging
	 	
	    $cbfind("#BTN_EXCEL").click(function() { // Excel download Button
	        fn_exptFile("exportExcel", fn_getIndex());
	    });
	    $cbfind("#BTN_PDF").click(function() { // PDF download Button
	        fn_exptFile("exportReport", fn_getIndex());
	    });
	    
	    // Check date period
	    $cbfind("input[name='SRCH_RD_DT']").change(function () {
	        fn_checkDatePicker($cbfind("#DIV_SRCH #SRCH_DT"), $cbfind(this).cbVal());
	    });
	    
	});
	
	// Initialize Function
	function fn_init() {
	    gfn_setCntrOrg($cbfind("#DIV_SRCH"), "CNTR");
	}
	
	function fn_time_format(time) {
		
		if (gfn_isNull(time)) {
			return;
		}
		
		var date = new Date();
		var hour = time.substring(0,2);
		var minute = time.substring(2,4);
		var second = time.substring(4,6);

		date.setHours(hour,minute,second);
		
		return kendo.toString(date, "h:mm tt");
	}
	
	// index of selected li or tab
	 function fn_getIndex(){
	     return $("li.ui-state-active").index();
	    }
	 
	 //search function
	 function fn_srch(){
		 
			var option = {};
			var data   = {};
			var source = {};
		
		if (fn_getIndex()=='0'){
			source = corebase.getSource("#DIV_SRCH");
		    
		    data.SELECT_DAY_CALL_TOT = corebase.Input("select", "CRPT2010.SELECT_DAY_CALL_TOT", source); // Search Daily Call Total
			data.SELECT_DAY_CALL_TOT_DETL = corebase.Input("selectList", "CRPT2010.SELECT_DAY_CALL_TOT_DETL", source); // Search Daily Call Detail
			
			option.data = data;

			corebase.ajax(option, function (output, metadata) {
				$cbfind("#DAY_CALL_TOT").cbBindData(output.SELECT_DAY_CALL_TOT);
				$cbfind("#GRD_TOT_LIST").cbBindData(output.SELECT_DAY_CALL_TOT_DETL);
			});
		}
		else if (fn_getIndex()=='1'){	
			source = corebase.getSource("#DIV_SRCH");
		    source = $cbfind("#GRD_REC_LIST").cbSpread().getPageSource(source); // Grid Page Source
		    corebase.selectList ( source, "CRPT2010.SELECT_DAY_CALL_REC", function (output, metadata){
		    	for(var i=0 ; i<output.length ; i++) {
		    		//output[i].STR_TM = fn_time_format(output[i].STR_TM);
		    	}
		        $cbfind("#GRD_REC_LIST").cbSpread().cbBindData(output, metadata); // page (cbSpread() and metadata Add)
		    });
		} 
	}
	 
	
	// File export function
	function fn_exptFile(type, tabIndex) {
	    
	    if(!cb.confirm(type == "exportExcel" ? cb.locMessage("msg.257", "Do you want export Excel file?") : cb.locMessage("msg.1657", "Do you want export PDF file?"))) return;
	    
	    var options = {};
	    var data= {};
	    var source = {};
	    
	    source = corebase.getSource("#DIV_SRCH");
	    
	    var detail = [];
	    detail.push(cb.locMessage("txt.1219", "Date") + " : " + $cbfind("#DIV_SRCH #SRCH_DT").cbText());
	    detail.push(cb.locMessage("txt.972", "Organization") + " : " + $cbfind("#DIV_SRCH #CMB_CNTR_CD").cbText() + " / " + $cbfind("#DIV_SRCH #CMB_GRP_CD").cbText() + " / " + $cbfind("#DIV_SRCH #CMB_TEAM_CD").cbText());
	    
	    var header = {};
	    header.exportParam = {};
	    header.exportParam.programId = GV_PGM.programId + "-" + tabIndex;
	    header.exportParam.fileName = gfn_getProgramTitle(GV_PGM.programId, "_") + "_" + CB.today();
	    header.exportParam.title = gfn_getProgramTitle(GV_PGM.programId);
	    header.exportParam.date = $cbfind("#DIV_SRCH #SRCH_DT").cbText();
	    header.exportParam.team = $cbfind("#DIV_SRCH #CMB_CNTR_CD").cbText() + " / " + $cbfind("#DIV_SRCH #CMB_GRP_CD").cbText() + " / " + $cbfind("#DIV_SRCH #CMB_TEAM_CD").cbText();
	    header.exportParam.format = "pdf";
	    header.exportParam.detail = detail;
	    
	    if (tabIndex == '0'){
		    header.exportParam.target = $cbwrap.cbSpread("#GRD_TOT_LIST");
		        
		    data.SELECT_DAY_CALL_TOT_DETL = corebase.Input("selectList", "CRPT2010.SELECT_DAY_CALL_TOT_DETL", source, header); // select query
		    //data.SELECT_DAY_CALL_TOT = corebase.Input("selectList", "CRPT2010.SELECT_DAY_CALL_TOT", source, header); // select query
	    }
	    else if (tabIndex == '1'){
	    	header.exportParam.target = $cbwrap.cbSpread("#GRD_REC_LIST");
		        
	 	    data.SELECT_DAY_CALL_REC = corebase.Input("selectList", "CRPT2010.SELECT_DAY_CALL_REC", source, header); // select query
	 	    
	    }
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