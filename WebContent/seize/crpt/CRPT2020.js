 // ***********************************************************************************************
 // Program Name : [CRPT2020] Complaint Management Report
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2018. 03. 14
 // Description  : Complaint Management Report Screen
 // Modify Desc  : 
 // -----------------------------------------------------------------------------------------------
 // Date         | Updater        | Remark
 // -----------------------------------------------------------------------------------------------
 //     
 //        
 // ***********************************************************************************************/
corebase.wrapping("#CRPT2020", function($cbwrap, $cbfind, corebase) {
	
	var isManager = false;
	var mangDept = [];
	
	// document ready
	$(document).ready(function() {		

		// Check date period
        $("input[name='SRCH_RD_DT']").change(function () {
        	gfn_checkDatePicker($("#DIV_SRCH #SRCH_STR_DT"), $("#DIV_SRCH #SRCH_END_DT"), $(this).cbVal());
        });
        
    	// Button Click 
        $("#BTN_SRCH").click(fn_srch); // Search Button
        
		// Grid Paging
		$("#GRD_RPT").cbSpread().pagesearch(fn_srch);
		$("#GRD_RPT_DETL").cbSpread().pagesearch(fn_srchDETL);
        
     	$("#BTN_EXCEL").click(function() { // Excel download Button
        	fn_exptFile("exportExcel");
        });
        $("#BTN_PDF").click(function() { // PDF download Button
        	fn_exptFile("exportReport");
        }); 
                
		// Grid click
		$cbwrap.cbSpread("#GRD_RPT").click(fn_srchDETL);
		
		var source = {};
	    
	    corebase.selectList(source, "CHLP1020.SELECT_MANG_CHK", function(output, metadata) {
	    	
	       // Is complaint manager check(민원 처리 담당자 여부 확인)
	       if(output.length > 0){
	    	   
	    	   for(var i=0 ; i<output.length ; i++){
	    		   mangDept.push(output[i].CODE);
	    	   }
	    	   
	    	   var delDept = new Array();
	    	   
	    	   
	    	   var datas = $("#CMB_DEPT_CD").data("kendoDropDownList").dataSource.data();
	    	   
	    	   for(var i=0 ; i<datas.length ;i++){
	    		   del = true;
	    		   var data = datas[i];
	    		   for(var k=0 ; k<mangDept.length ; k++){
	    			   
	    			   if(data.value == mangDept[k] || data.value == "" ){
	    				   del = false;
	    			   }
	    		   }
	    		   
	    		   if(del == true){
	    			   delDept.push(data.value);
	    		   }
	    	      
	    	   }
	    	   
	    	   CBCombo.removeComboData($cbfind("#CMB_DEPT_CD"),delDept);
	    	   $cbfind("#CMB_DEPT_CD").cbVal(mangDept);
	    	   
	    	   isManager = true;
	           
	       }
	    });
	    
	});
	
	// Search function
    function fn_srch() {
    	
        if (!gfn_validDate($("#DIV_SRCH #SRCH_STR_DT").cbVal(), $("#DIV_SRCH #SRCH_END_DT").cbVal(), "Y", "31")) {
			return;
        }
        
        $cbwrap.cbSpread("#GRD_RPT_DETL").clear(); // Grid Initialize
  	    
		var source = {};
		source = corebase.getSource("#DIV_SRCH");
	    source = $cbfind("#GRD_RPT").cbSpread().getPageSource(source); // Grid Page Source
	    
	    if(isManager == true){
	    	source.IS_MANG = "Y";
	    }
	    
	    corebase.selectList ( source, "CRPT2020.SELECT_CMLN_DEPT", function (output, metadata){
	        $cbfind("#GRD_RPT").cbSpread().cbBindData(output, metadata); // page (cbSpread() and metadata Add)
	    });
    }
    
 // Search Detail function
	function fn_srchDETL(){
		
		var sourceForDetail = {};
		sourceForDetail = $cbfind("#GRD_RPT").cbSpread().getRowObject();
		sourceForDetail.SRCH_STR_DT=$cbfind("#SRCH_STR_DT").cbVal();
		sourceForDetail.SRCH_END_DT=$cbfind("#SRCH_END_DT").cbVal();		
		sourceForDetail = $cbfind("#GRD_RPT_DETL").cbSpread().getPageSource(sourceForDetail); // Grid Page Source
		
		corebase.selectList ( sourceForDetail, "CRPT2020.SELECT_CMLN_DETL", function (output, metadata){
	        $cbfind("#GRD_RPT_DETL").cbSpread().cbBindData(output, metadata) // page (cbSpread() and metadata Add)
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
    	detail.push(cb.locMessage("txt.1326", "Query Period") + " : " + $("#DIV_SRCH #SRCH_STR_DT").cbText() + " ~ " + $("#DIV_SRCH #SRCH_END_DT").cbText());
    	detail.push(cb.locMessage("txt.900", "Department") + " : " + $("#DIV_SRCH #CMB_DEPT_CD").cbText());
        
		var header = {};
		header.exportParam = {};
    	header.exportParam.programId = GV_PGM.programId;
    	header.exportParam.fileName = gfn_getProgramTitle(GV_PGM.programId, "_") + "_" + CB.today();
    	header.exportParam.title = gfn_getProgramTitle(GV_PGM.programId);
    	header.exportParam.strDate = $("#DIV_SRCH #SRCH_STR_DT").cbText();
        header.exportParam.endDate = $("#DIV_SRCH #SRCH_END_DT").cbText();
        header.exportParam.dept = $("#DIV_SRCH #CMB_DEPT_CD").cbText();
    	header.exportParam.format = "pdf";
    	header.exportParam.target = $.cbSpread("#GRD_RPT_DETL");
    	header.exportParam.detail = detail;
    	
	    data.SELECT_CMLN_DETL_PRN = corebase.Input("selectList", "CRPT2020.SELECT_CMLN_DETL_PRN", source, header); // select query
	    
	    options.method = type;//"exportExcel", "exportReport";
	    options.data = data;
	    
	    corebase.ajax(options);
	}
	
});