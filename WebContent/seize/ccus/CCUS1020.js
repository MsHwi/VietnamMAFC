
// ***********************************************************************************************
// Program Name : [CCUS1020] Management Customer Status Script
// Creator      : hwi@buttle.co.kr
// Create Date  : 2017. 10. 18
// Description  : Management Customer Status screen(고객 관리상태 조회 화면) Script
// Modify Desc  : 
// -----------------------------------------------------------------------------------------------
// Date         | Updater        | Remark
// -----------------------------------------------------------------------------------------------
//     
//        
// ***********************************************************************************************/

corebase.wrapping("#CCUS1020", function($cbwrap, $cbfind, corebase) {
	// corebase fired initialize event
	corebase.firedInit = function() {
		// Initialize
		fn_init();
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

	// Initialize function
	function fn_init() {
		gfn_setCntrOrg($cbfind("#DIV_SRCH"), "");
	}

	// Search function
	function fn_srch() {

		// Check date duration
		if (!gfn_validDate($cbfind("#DIV_SRCH #SRCH_STR_DT").cbVal(), $cbfind(
				"#DIV_SRCH #SRCH_END_DT").cbVal(), "Y", "31")) {
			return;
		}

		$cbwrap.cbSpread("#GRD_DETAIL_LIST").clear(); // Grid Initialize

		var source = {};
		source = corebase.getSource("#DIV_SRCH");
		source = $cbfind("#GRD_LIST").cbSpread().getPageSource(source); // paging

		// Management status Search
		corebase.selectList(source, "CCUS1020.SELECT_MNG_STT_INFO", function(
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
		detail.push(cb.locMessage("txt.606", "Name") + " : "
				+ $cbfind("#DIV_SRCH #CUST_NM").cbText());
		detail.push(cb.locMessage("txt.1302", "Contact No") + " : "
				+ $cbfind("#DIV_SRCH #CNNT_TEL_NO").cbText());
//		detail.push(cb.locMessage("txt.636", "Mgt. Status") + " : "
//				+ $cbfind("#DIV_SRCH #MGR_STS_CD").cbText());
		detail.push(cb.locMessage("txt.972", "Organization") + " : "
				+ $cbfind("#DIV_SRCH #CMB_CNTR_CD").cbText() + " / "
				+ $cbfind("#DIV_SRCH #CMB_GRP_CD").cbText() + " / "
				+ $cbfind("#DIV_SRCH #CMB_TEAM_CD").cbText() + " / "
				+ $cbfind("#DIV_SRCH #CMB_USR_ID").cbText());

		var header = {};
		header.exportParam = {};
		header.exportParam.programId = "CCUS1020";
		header.exportParam.fileName = gfn_getProgramTitle(GV_PGM.programId, "_")
				+ "_" + CB.today();
		header.exportParam.title = gfn_getProgramTitle(GV_PGM.programId);
		header.exportParam.format = "pdf";
		header.exportParam.target = $cbwrap.cbSpread("#GRD_LIST");
		header.exportParam.detail = detail;

		data.SELECT_CUST_INFO = corebase.Input("selectList",
				"CCUS1020.SELECT_MNG_STT_INFO", source, header); // select
																	// query

		options.method = type;// "exportExcel", "exportReport";
		options.data = data;

		corebase.ajax(options);
	}

	// Grid function
	function fn_grid() {
		var source = {};
		source = $cbfind("#GRD_LIST").cbSpread().getRowObject();

		// Management status registration history list Search
		corebase.selectList(source, "CCUS1020.SELECT_MNG_STT_HIST", function(
				output, metadata) {
			$cbfind("#GRD_DETAIL_LIST").cbBindData(output);
		});
	}
});