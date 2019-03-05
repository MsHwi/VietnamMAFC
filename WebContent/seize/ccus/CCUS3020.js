
// ***********************************************************************************************
// Program Name : [CCUS3020] Register Customer Status Script
// Creator      : hwi@buttle.co.kr
// Create Date  : 2017. 10. 25
// Description  : Register Customer Status screen(고객 관리상태 등록 화면) Script
// Modify Desc  : 
// -----------------------------------------------------------------------------------------------
// Date         | Updater        | Remark
// -----------------------------------------------------------------------------------------------
//     
//        
// ***********************************************************************************************/

corebase.wrapping("#CCUS3020", function($cbwrap, $cbfind, corebase) {
	/*
	 * GV_PGM.source DS_OUTPUT_CUST_INFO(CUST_NO, NAME), CNSL_SEQNO
	 */
	var oParent = GV_PGM.source;

	// docuemt ready
	$cbfind(document).ready(function() {
		// Initialize
		fn_init();

		// Initialize button click
		$cbfind("#BTN_NEW").click(fn_new);

		// Save button click
		$cbfind("#BTN_SAVE").click(fn_save);
		
		// Grid click
		$cbwrap.cbSpread("#GRD_LIST").click(fn_grid);

		// Management Status combo change
//		$cbfind("#DIV_DETAIL #MGR_STS_CD").change(fn_changeMngStt);
	});

	// Initialize function
	function fn_init() {
		$cbfind("#DIV_DETAIL").cbBindData(oParent);

		var source = {};
		source.CUST_NO = $cbfind("#DIV_DETAIL #CUST_NO").cbVal();
		// Customer Status History Search
		corebase.selectList(source, "CCUS1020.SELECT_MNG_STT_HIST", function(output, metadata) {
			$cbfind("#GRD_LIST").cbBindData(output);
		});

//		$cbfind("#DIV_DETAIL #MGR_STS_CD").cbClearOData(); // Management status
														// clear
//		$cbfind("#DIV_DETAIL #MNG_STATE_MEMO").cbClearOData(); // Infomation of
		// management status
		// clear
		$cbfind("#DIV_DETAIL #REG_CTT").cbClearOData(); // Memo clear
	}

	// New function(신규등록 함수)
	function fn_new() {
//		$cbfind("#DIV_DETAIL #MGR_STS_CD").cbClearOData(); // Management status
//		$cbfind("#DIV_DETAIL #MNG_STATE_MEMO").cbClearOData(); // Infomation of
		// management status
		// clear
		$cbfind("#DIV_DETAIL #REG_CTT").cbClearOData(); // Memo clear
	}

	// Save function
	function fn_save() {

//		if (CBData.isEmpty($cbfind("#DIV_DETAIL #MGR_STS_CD").cbVal())) {
//			CBMsg.error(cb.locMessage("msg.56", "Please select a managed status."));
//			$cbfind("#DIV_DETAIL #MGR_STS_CD").focus();
//			return;
//		}

		if (CBData.isEmpty($cbfind("#DIV_DETAIL #CUST_NO").cbVal())) {
			CBMsg.error(cb.locMessage("msg.48", "Customer number does not exist."));
			$cbfind("#DIV_DETAIL #CUST_NO").focus();
			return;
		}

		if (!cb.confirm(cb.locMessage("msg.309", "Do you want to save?"))) {
			return;
		}

		var source = {};
		source = corebase.getSource("#DIV_DETAIL");
		

		// Register Customer Status
		corebase.insert(source, "CCUS3020.INSERT_CUST_MGR_STS_HIST", function(output, metadata) {
			CBMsg.error(cb.locMessage("msg.306", "Save completed."));
			corebase.closeWindow();
		});
	}

	// Management status combo change function
//	function fn_changeMngStt() {
//		var source = {};
//		source.SMLCLAS_CD = $cbfind("#DIV_DETAIL #MGR_STS_CD").cbVal();
//
//		// Memo Search
//		corebase.selectList(source, "CCUS3020.SELECT_MNG_MEMO", function(output, metadata) {
//			$cbfind("#DIV_DETAIL #MNG_STATE_MEMO").cbBindData(output);
//		});
//	}
	
	// Grid function
	function fn_grid() {
	    // Date Binding
	    var grdRow = $cbfind("#GRD_LIST").cbSpread().getRowObject();
	    $cbfind("#DIV_DETAIL").cbBindData(grdRow);
//	    fn_changeMngStt();
	}
});