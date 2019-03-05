
 // ***********************************************************************************************
 // Program Name : [CRPT3018] Approved-Disbursed
 // Creator      : jekalhg@buttle.co.kr
 // Create Date  : 2018. 03. 19
 // Description  : Approved-Disbursed
 // Modify Desc  : 
 // -----------------------------------------------------------------------------------------------
 // Date         | Updater        | Remark
 // -----------------------------------------------------------------------------------------------
 //     
 //        
 // ***********************************************************************************************/

corebase.wrapping("#CRPT3018", function($cbwrap, $cbfind, corebase) {
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
        if(!gfn_validDate($cbfind("#DIV_SRCH #SRCH_STR_DT").cbVal(), $cbfind("#DIV_SRCH #SRCH_END_DT").cbVal(), "Y", "31")) {
            return;
        }
        
        var source = {};
        source = corebase.getSource("#DIV_SRCH");
        source = $cbfind("#GRD_RPT").cbSpread().getPageSource(source); // Grid Page Source
        
        corebase.selectList(source, "CRPT3018.SELECT_APPROV_DISB", function(output, metadata) {
            $cbfind("#GRD_RPT").cbSpread().cbBindData(output, metadata); // page (cbSpread() and metadata Add)
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
        
        data.SELECT_APPROV_DISB = corebase.Input("selectList", "CRPT3018.SELECT_APPROV_DISB", source, header); // select query
        
        options.method = type;//"exportExcel", "exportReport";
        options.data = data;
        
        corebase.ajax(options);
    }
});