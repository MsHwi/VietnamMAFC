
// ***********************************************************************************************
// Program Name : [CCUS1010] Registered Customers Script
// Creator      : hwi@buttle.co.kr
// Create Date  : 2017. 10. 16
// Description  : Registered Customers screen(등록고객조회 화면) Script
// Modify Desc  : 
// -----------------------------------------------------------------------------------------------
// Date         | Updater        | Remark
// -----------------------------------------------------------------------------------------------
//     
//        
// ***********************************************************************************************/
	
corebase.wrapping("#CCUS1010", function($cbwrap, $cbfind, corebase) {
	// corebase fired initialize event
	corebase.firedInit = function() {
		gfn_setCntrOrg($cbfind("#DIV_SRCH"), "");
	};

	// docuemt ready
	$cbfind(document).ready(function() {
		// Enter Key Event
		gfn_setEnter("#DIV_SRCH", fn_srch);

		// Search button click
		$cbfind("#BTN_SRCH").click(fn_srch);
		$cbfind("#GRD_LIST").cbSpread().pagesearch(fn_srch);

		// Excel button click
		$cbfind("#BTN_EXCEL").click(function() {
			fn_exptFile("exportExcel");
		});

		// Grid click
		$cbwrap.cbSpread("#GRD_LIST").click(fn_grid);

	});

	// Search function
	function fn_srch() {
		// Check date duration
		if (!gfn_validDate($cbfind("#DIV_SRCH #SRCH_STR_DT").cbVal(), $cbfind(
				"#DIV_SRCH #SRCH_END_DT").cbVal(), "Y", "31")) {
			return;
		}

		$cbwrap.cbSpread("#GRD_LIST").clear(); // Grid Clear
		$cbfind("#DIV_DETAIL").cbClearOData(); // DIV_DETAIL Clear

		var source = {};
		source = corebase.getSource($cbfind("#DIV_SRCH"));

		source = $cbfind("#GRD_LIST").cbSpread().getPageSource(source); // paging
		corebase.selectList(source, "CCUS1010.SELECT_CUST_INFO", function(
				output, metadata) {
			$cbfind("#GRD_LIST").cbSpread().cbBindData(output, metadata); // paging
		});
	}

	// File export function
	function fn_exptFile(type) {

		if (!gfn_validDate($cbfind("#DIV_SRCH #SRCH_STR_DT").cbVal(), $cbfind(
				"#DIV_SRCH #SRCH_END_DT").cbVal(), "Y", "31")) {
			return;
		}

		if (!cb.confirm(type == "exportExcel" ? cb.locMessage("msg.257",
				"Do you want export Excel file?") : cb.locMessage("msg.1657",
				"Do you want export PDF file?")))
			return;

		var options = {};
		var data = {};
		var source = {};

		source = corebase.getSource("#DIV_SRCH");

		var detail = [];
		detail.push(cb.locMessage("txt.678", "Date") + " : "
				+ $cbfind("#DIV_SRCH #SRCH_STR_DT").cbText() + " ~ "
				+ $cbfind("#DIV_SRCH #SRCH_END_DT").cbText());
		detail.push(cb.locMessage("txt.608", "Cust Name") + " : "
				+ $cbfind("#DIV_SRCH #CUST_NM").cbText());
		detail.push(cb.locMessage("txt.2004", "Cust. ID No.") + " : "
				+ $cbfind("#DIV_SRCH #REALNM_NO").cbText());
		detail.push(cb.locMessage("txt.1301", "Phone No") + " : "
				+ $cbfind("#DIV_SRCH #SRCH_TEL_NO").cbText());
		detail.push(cb.locMessage("txt.1891", "Area") + " : "
				+ $cbfind("#DIV_SRCH #AREA_CD").cbText());
		detail.push(cb.locMessage("txt.2240", "Occupation") + " : "
				+ $cbfind("#DIV_SRCH #OCP_CD").cbText());
		detail.push(cb.locMessage("txt.972", "Organization") + " : "
				+ $cbfind("#DIV_SRCH #CMB_CNTR_CD").cbText() + " / "
				+ $cbfind("#DIV_SRCH #CMB_GRP_CD").cbText() + " / "
				+ $cbfind("#DIV_SRCH #CMB_TEAM_CD").cbText() + " / "
				+ $cbfind("#DIV_SRCH #CMB_USR_ID").cbText());

		var header = {};
		header.exportParam = {};
		header.exportParam.programId = "CCUS1010";
		header.exportParam.fileName = gfn_getProgramTitle(GV_PGM.programId, "_")
				+ "_" + CB.today();
		header.exportParam.title = gfn_getProgramTitle(GV_PGM.programId);
		header.exportParam.format = "pdf";
		header.exportParam.target = $cbwrap.cbSpread("#GRD_LIST");
		header.exportParam.detail = detail;

		data.SELECT_CUST_INFO = corebase.Input("selectList",
				"CCUS1010.SELECT_CUST_INFO", source, header); // select query

		options.method = type;// "exportExcel", "exportReport";
		options.data = data;

		corebase.ajax(options);
	}

	// Grid function
	function fn_grid() {
		// Date Binding
		var row = $cbfind("#GRD_LIST").cbSpread().getRowObject();
		$cbfind("#DIV_DETAIL").cbBindData(row);
		
	}
});
