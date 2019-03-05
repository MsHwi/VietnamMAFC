
 // ***********************************************************************************************
 // Program Name : [CKNW1030] Search Knowledge Script
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2017. 12. 25
 // Description  : Search Knowledge(지식검색) Script
 // Modify Desc  : 
 // -----------------------------------------------------------------------------------------------
 // Date         | Updater        | Remark
 // -----------------------------------------------------------------------------------------------
 //     
 //        

corebase.wrapping("#CKNW1030", function($cbwrap, $cbfind, corebase) {
	// Global variable
	var parent = GV_PGM.source;
	
	corebase.reload = function(obj){
		fn_init(obj);
	};
	
	// docment ready 
	$cbfind(document).ready(function() {
	
		// Knowledge Tab click 
		$cbfind("a[href=#tab-no1]").click(function() {
			fn_srchKnowledge();
		});
	
		// Consultation History Tab click 
		$cbfind("a[href=#tab-no2]").click(function() {
			fn_srchRemark();
		});
		
		gfn_setEnter("#DIV_SRCH", fn_srch);
	
		$cbfind("#BTN_SRCH").click(fn_srch);
		
		$cbfind("#GRD_KNW").cbSpread().pagesearch(fn_srchKnowledge);
		$cbwrap.cbSpread("#GRD_KNW").rowTemplate(kendo.template($cbfind("#rowTmplKnowledge").html()));
		$cbwrap.cbSpread("#GRD_KNW").altRowTemplate(kendo.template($cbfind("#rowTmplKnowledge").html()));
	
		$cbfind("#GRD_RMK").cbSpread().pagesearch(fn_srchRemark);
		$cbwrap.cbSpread("#GRD_RMK").rowTemplate(kendo.template($cbfind("#rowTmplRemark").html()));
		$cbwrap.cbSpread("#GRD_RMK").altRowTemplate(kendo.template($cbfind("#rowTmplRemark").html()));
		
		$cbfind("#SRCH_STR_DT").cbElemDisable(true);
		$cbfind("#SRCH_END_DT").cbElemDisable(true);
	
		$cbfind("#CHK_DT").change(function(e) {
			$cbfind("#SRCH_STR_DT").cbElemDisable(!this.checked);
			$cbfind("#SRCH_END_DT").cbElemDisable(!this.checked);
		});
	
		$cbfind("#BTN_KNW_EXP").click(function() {
			$cbfind("#TREE_KNW").cbTreeView().expand();
		});
		$cbfind("#BTN_KNW_CLS").click(function() {
			$cbfind("#TREE_KNW").cbTreeView().collapse();
		});
	
		$cbfind("#BTN_CNT_EXP").click(function() {
			$cbfind("#TREE_CNT").cbTreeView().expand();
		});
		$cbfind("#BTN_CNT_CLS").click(function() {
			$cbfind("#TREE_CNT").cbTreeView().collapse();
		});
	
		// Click to Knowledge tree auto Search
		$cbfind("#TREE_KNW").click(function(e) {
			var node = $cbfind(this).cbTreeView().getNode();
			if (CBData.isEmpty($cbfind(e.target).text()) || CBData.isEmpty(node)) { return; }
			var data = $cbfind(this).data("kendoTreeView").dataItem(node);
			
			$cbfind("#KNW_LRGCLAS_CD").cbVal("");
			$cbfind("#KNW_MIDCLAS_CD").cbVal("");
			$cbfind("#KNW_SMLCLAS_CD").cbVal("");
			
			if (!CBData.isEmpty(data.KNW_TYP_CD_LST)) {
				var arrCode = data.KNW_TYP_CD_LST.split(",");
				for (var i=0; i<arrCode.length; i++) {
					if (i == 0) { 
						$cbfind("#KNW_LRGCLAS_CD").cbVal(arrCode[0]);
					}
					else if (i == 1) { 
						$cbfind("#KNW_MIDCLAS_CD").cbVal(arrCode[1]);
					}
					else if (i == 2) { 
						$cbfind("#KNW_SMLCLAS_CD").cbVal(arrCode[2]); 
					}
				}
			}
			
			fn_srch();
		});
	
		// Click to Consultation tree auto Search
		$cbfind("#TREE_CNT").click(function(e) {
			var node = $cbfind(this).cbTreeView().getNode();
			if (CBData.isEmpty($cbfind(e.target).text()) || CBData.isEmpty(node)) { return; }
			var data = $cbfind(this).data("kendoTreeView").dataItem(node);
			
			$cbfind("#CNSL_LRGCLAS_CD").cbVal("");
			$cbfind("#CNSL_MEDCLAS_CD").cbVal("");
			$cbfind("#CNSL_SMLCLAS_CD").cbVal("");
	
			if (!CBData.isEmpty(data.CNSL_CD_LST)) {
				var arrCode = data.CNSL_CD_LST.split(",");
				for (var i=0; i<arrCode.length; i++) {
					if (i == 0) { 
						$cbfind("#CNSL_LRGCLAS_CD").cbVal(arrCode[0]);
					}
					else if (i == 1) { 
						$cbfind("#CNSL_MEDCLAS_CD").cbVal(arrCode[1]);
					}
					else if (i == 2) { 
						$cbfind("#CNSL_SMLCLAS_CD").cbVal(arrCode[2]); 
					}
				} 
			}
			
			fn_srch();
		});
	
		fn_init(parent);
		
		fn_srchTreeInfo();
		
		
		$cbfind("#GRD_KNW").delegate(".knw-title","click",function(){
			
			fn_showKnow($(this).data("seqno"));
			
		});
		
		$cbfind("#GRD_RMK").delegate(".knw-title","click",function(){
			
			fn_showCont($(this).data("callid"));
			
		});
		
		
		
		
	});
	
	// Initialize function
	function fn_init(obj) {
	
		var keyword = "";
		if (!CBData.isEmpty(obj) && !CBData.isEmpty(obj.keyword)) {
			keyword = obj.keyword || "";
		}
	
		$cbfind("#KEYWORD").cbVal(keyword);
		
		// Search
		fn_srch();
	}
	
	// Search function
	function fn_srch() {
		var active = $cbfind("#TAB_ITEM").tabs("option", "active");
		
		switch (active) {
		case 0 : fn_srchKnowledge(); break;
		case 1 : fn_srchRemark(); break;
		}
	}
	
	// Search Knowledge
	function fn_srchKnowledge() {
		
		$cbwrap.cbSpread("#GRD_KNW").clear();
		
		var source = corebase.getSource($cbfind("#DIV_SRCH"));
		if (!$cbfind("#CHK_DT").is(":checked")) {
			source.SRCH_STR_DT = "";	
			source.SRCH_END_DT = "";
		}
		
		source = $cbfind("#GRD_KNW").cbSpread().getPageSource(source);
		
		corebase.selectList(source, "CKNW1030.SELECT_KNW", function(output, metadata) {
			$cbfind("#GRD_KNW").cbSpread().cbBindData(output, metadata);
			// if search result count is above 0 then save keyword hsitory(조회된 건수가 있으면 키워드 이력에 저장)
			if (metadata.resultCount > 0) {
				fn_saveSearchKeyword();
			}
		});
	}
	
	// Search Remark(Consultation History)
	function fn_srchRemark() {
		
		$cbwrap.cbSpread("#GRD_RMK").clear();
		
		var source = corebase.getSource($cbfind("#DIV_SRCH"));
		if (!$cbfind("#CHK_DT").is(":checked")) {
			source.SRCH_STR_DT = "";	
			source.SRCH_END_DT = "";
		}
		
		source = $cbfind("#GRD_RMK").cbSpread().getPageSource(source);
		
		corebase.selectList(source, "CKNW1030.SELECT_RMK", function(output, metadata) {
			$cbfind("#GRD_RMK").cbSpread().cbBindData(output, metadata);
			// if search result count is above 0 then save keyword hsitory(조회된 건수가 있으면 키워드 이력에 저장)
			if (metadata.resultCount > 0) {
				fn_saveSearchKeyword();
			}
		});
	}
	
	// Show Knowledge detail Popup Function
	function fn_showKnow (knwSeq) {
		
		var source = {};
		var options = {};
		
		source.KNW_INF_SEQNO = knwSeq;
		options.callback = function(retSource) {
			if (retSource.RESULT) {
				fn_srch();
			}
		};
		corebase.popup("CKNW1035", source, options);
	}
	
	// Show Consultation detail Popup Function
	function fn_showCont(cnslSeq) {
		
		if(CBData.isEmpty(cnslSeq)) return;
		
		var source = {};
		
		source.CALL_CNSL_ID = cnslSeq;
		
		corebase.select(source, "CKNW1030.SELECT_CALL_HIST", function(output, metadata) {
			
			if (CBData.isEmpty(output)) { output = {CNSL_DV_CD : ""}; }
			
			var popupId = "CCLT1020";
			
			if(output.CNSL_DV_CD != "IB") {
				popupId = "CCLT2020";
			}
	        
			var source = {};
			source.CALL_CNSL_ID = cnslSeq;
			
			corebase.popup(popupId, source, {});
		});
	}
	
	// set default string
	window.fn_setDefStr = function(val) {
		if (!CBData.isEmpty(val)) {
			return val;
		}
		
		return "";
	}
	
	// search tree information
	function fn_srchTreeInfo() {
		var source = {};
		var option = {};
		var data = {};
		
		data.SELECT_KNW_DIV_TREE = corebase.Input("selectList", "CKNW1030.SELECT_KNW_DIV_TREE",  source);
		data.SELECT_CNT_DIV_TREE = corebase.Input("selectList", "CKNW1030.SELECT_CNT_DIV_TREE", source);
		option.data = data;
		
		corebase.ajax(option, function (output, metadata) {
			$cbfind("#TREE_KNW").cbTreeView().setObject(output.SELECT_KNW_DIV_TREE);
			$cbfind("#TREE_CNT").cbTreeView().setObject(output.SELECT_CNT_DIV_TREE);
			
			$cbfind("#TREE_KNW").data("kendoTreeView").expand("li:first"); // only expand first node
			$cbfind("#TREE_CNT").data("kendoTreeView").expand("li:first"); // only expand first node
			
			$cbfind("#TREE_KNW").data("kendoTreeView").select(".k-first");
			$cbfind("#TREE_CNT").data("kendoTreeView").select(".k-first");
		});
	}
	
	// save search keyword history
	function fn_saveSearchKeyword() {
		var source = {};
		source.KEYWORD = $cbfind("#KEYWORD").cbVal();
		if (CBData.isEmpty(source.KEYWORD)) {
			return;
		}
		corebase.insert(source, "CKNW1000.MERGE_KNW_KEYWORD_SRCH", function (output, metadata) {
		});
	}
	
	// browser close button click event(return data)
	window.onbeforeunload = function () {
		corebase.closeWindow();
	};
});