
 // ***********************************************************************************************
 // Program Name : [CRPT3019] Team Performance
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2018. 03. 19
 // Description  : Team Performance
 // Modify Desc  : 
 // -----------------------------------------------------------------------------------------------
 // Date         | Updater        | Remark
 // -----------------------------------------------------------------------------------------------
 //     
 //        
 // ***********************************************************************************************/

corebase.wrapping("#CRPT3019", function($cbwrap, $cbfind, corebase) {
    corebase.firedInit = function() {
        fn_init();
    };
    
    // document ready
    $cbfind(document).ready(function() {
         $cbfind("#BTN_SRCH").click(fn_srch);
        //$cbfind("#GRD_RPT").cbSpread().pagesearch(fn_srch); // Grid Paging
        
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
        $cbfind("#SRCH_STR_DT, #SRCH_END_DT").change(function() {
            fn_setDate($(this).cbVal());
       });
        
    });
    
    // Initialize Function
    function fn_init() {
        gfn_setCntrOrg($cbfind("#DIV_SRCH"), "TEAM");
        
        fn_srchDate(1); // 1 : Only Grid Setting
    }
    
    // target month search function
    // pNum 1: Only Grid Setting, 2: Grid Setting & data search
    function fn_srchDate(pNum) {
        var source = {};
        source = corebase.getSource("#DIV_SRCH");
        
        corebase.selectList(source, "CRPT3019.SELECT_DATE", function ( output, metadata ) {
            fn_setting(output, source, pNum);
        });
    }
    
    // dynamic grid create function
    function fn_setting(pDate, pSource, pNum) {
        var htmlGrid = [];
        htmlGrid.push("<div style=' position:absolute; top:0px; bottom:30px; width:100%;' data-option='type:spread'>");
        htmlGrid.push("<table id='GRD_RPT' class='spread' data-spread='operationmode:3;scrollable:0;rownum:0;'>");
        //htmlGrid.push("<table id='GRD_RPT' class='spread' data-spread='operationmode:3;scrollable:0;rownum:0;scrollbars:virtual;pagesize:40;'>");
        htmlGrid.push("  <thead>                                                                                           ");
        htmlGrid.push("    <tr>                                                                                            ");
        htmlGrid.push("      <th id='CNTR_NM'       width='100px'   data-column='align:center;'               rowspan='3'>" + cb.locMessage("txt.1021", "Center") + "</th>");
        htmlGrid.push("      <th id='GRP_NM'        width='100px'   data-column='align:center;'               rowspan='3'>" + cb.locMessage("txt.656",  "Group") + "</th>");
        htmlGrid.push("      <th id='TEAM_NM'       width='100px'   data-column='align:center;'               rowspan='3'>" + cb.locMessage("txt.1502", "Team") + "</th>");
        htmlGrid.push("      <th id='USR_ID'        width='90px'    data-column='align:center;'               rowspan='3'>" + cb.locMessage("txt.938",  "Agent ID") + "</th>");
        htmlGrid.push("      <th id='USR_NM'        width='140px'   data-column='align:left;'                 rowspan='3'>" + cb.locMessage("txt.724",  "Agent") + "</th>");
        htmlGrid.push("      <th id='POSN_NM'       width='80px'    data-column='align:center;'               rowspan='3'>" + cb.locMessage("txt.2433", "Title") + "</th>");
        htmlGrid.push("      <th id='ETCO_DT'       width='90px'    data-column='align:center;type:date;'     rowspan='3'>" + cb.locMessage("txt.2154", "Joining Date") + "</th>");
        htmlGrid.push("      <th id='WORK_DT'       width='100px'   data-column='align:right;type:number;'    rowspan='3'>" + cb.locMessage("txt.2485", "Working Days") + "</th>");
        htmlGrid.push("      <th id='LVCO_YN_NM'    width='70px'    data-column='align:center;'               rowspan='3'>" + cb.locMessage("txt.1040", "Status") + "</th>");
        htmlGrid.push("      <th id='DV'            width='100px'   data-column='align:center;'               colspan='10'>" + cb.locMessage("txt.694", "Performance") + "</th>");
        //htmlGrid.push("      <th id='DV'            width='100px'   data-column='align:center;'               rowspan='3'>" + cb.locMessage("txt.2235", "Note") + "</th>");
        
        htmlGrid.push("    </tr>                                                                                           ");
        htmlGrid.push("    <tr>                                                                                            ");
        htmlGrid.push("      <th id='DV'            width='100px'   data-column='align:center;'    colspan='5'>" + cb.locMessage("txt.2160", "Last month") + " (" + pDate[0].LAST_MONTH + ")</th>");
        htmlGrid.push("      <th id='DV'            width='100px'   data-column='align:center;'    colspan='5'>" + cb.locMessage("txt.2429", "This month") + " (" + pDate[0].THIS_MONTH + ")</th>");
        htmlGrid.push("    </tr>                                                                                           ");
        htmlGrid.push("    <tr>                                                                                            ");
        
        htmlGrid.push("      <th id='LAST_APP'           width='50px'    data-column='align:right;type:number;'>" + cb.locMessage("txt.1863", "App") + "</th>");
        htmlGrid.push("      <th id='LAST_DISBURSED'     width='50px'    data-column='align:right;type:number;'>" + cb.locMessage("txt.2054", "Disb.") + "</th>");
        htmlGrid.push("      <th id='LAST_AMTFIN'        width='100px'   data-column='align:right;type:number;'>" + cb.locMessage("txt.2156", "L.Amount") + "</th>");
        htmlGrid.push("      <th id='LAST_AVG_AMTFIN'    width='140px'   data-column='align:right;type:number;'>" + cb.locMessage("txt.1909", "Avrg. Loan Amount") + "</th>");
        htmlGrid.push("      <th id='LAST_APP_RATIO'     width='120px'   data-column='align:right;'>" + cb.locMessage("txt.1881", "Approval Ratio") + "</th>");
        htmlGrid.push("      <th id='THIS_APP'           width='50px'    data-column='align:right;type:number;'>" + cb.locMessage("txt.1863", "App") + "</th>");
        htmlGrid.push("      <th id='THIS_DISBURSED'     width='50px'    data-column='align:right;type:number;'>" + cb.locMessage("txt.2054", "Disb.") + "</th>");
        htmlGrid.push("      <th id='THIS_AMTFIN'        width='100px'   data-column='align:right;type:number;'>" + cb.locMessage("txt.2156", "L.Amount") + "</th>");
        htmlGrid.push("      <th id='THIS_AVG_AMTFIN'    width='140px'   data-column='align:right;type:number;'>" + cb.locMessage("txt.1909", "Avrg. Loan Amount") + "</th>");
        htmlGrid.push("      <th id='THIS_APP_RATIO'     width='120px'   data-column='align:right;'>" + cb.locMessage("txt.1881", "Approval Ratio") + "</th>");
        htmlGrid.push("    </tr>                                                                                           ");
        htmlGrid.push("  </thead>                                                                                          ");
        htmlGrid.push("</table>                                                                                            ");
        htmlGrid.push("</div>                                                                                              ");
        
        $cbfind("#DIV_GRD_LAYOUT").html(htmlGrid.join(""));
        $cbwrap.cbSpread("#GRD_RPT").refresh();
        
        if(pNum == 2) {
            corebase.selectList ( pSource, "CRPT3019.SELECT_TEAM_PERFORMANCE", function ( output, metadata ){
                //$cbfind("#GRD_RPT").cbSpread().cbBindData(output, metadata); // page (cbSpread() and metadata Add)
                $cbfind("#GRD_RPT").cbBindData(output);
            });
        }
    }
    
    // Search function
    function fn_srch() {
        // Check date
        if(!CBDate.isValidDate($cbfind("#SRCH_YM").cbVal())) {
            CBMsg.error(cb.locMessage("msg.75", "Enter the base year and month according to the format."));
            $cbfind("#SRCH_YM").focus();
            return;
        }
        
        $cbwrap.cbSpread("#GRD_RPT").clear(); // Grid Clear
        
        fn_srchDate(2); // 1 : Grid Setting & data search
    }
    
    // File export function
    function fn_exptFile(type) {
        /*if (!gfn_validDate($cbfind("#DIV_SRCH #SRCH_STR_DT").cbVal(), $cbfind("#DIV_SRCH #SRCH_END_DT").cbVal(), "Y", "31")) {
            return;
        }*/
        // Check date
        if(!CBDate.isValidDate($cbfind("#SRCH_YM").cbVal())) {
            CBMsg.error(cb.locMessage("msg.75", "Enter the base year and month according to the format."));
            $cbfind("#SRCH_YM").focus();
            return;
        }
        
        if(!cb.confirm(type == "exportExcel" ? cb.locMessage("msg.257", "Do you want export Excel file?") : cb.locMessage("msg.1657", "Do you want export PDF file?"))) return;
        
        var options = {};
        var data= {};
        var source = {};
        
        source = corebase.getSource("#DIV_SRCH");
        
        var detail = [];
        //detail.push(cb.locMessage("txt.1326", "Query Period") + " : " + $cbfind("#DIV_SRCH #SRCH_STR_DT").cbText() + " ~ " + $cbfind("#DIV_SRCH #SRCH_END_DT").cbText());
        detail.push(cb.locMessage("txt.1326", "Query Period") + " : " + $cbfind("#DIV_SRCH #SRCH_YM").cbText());
        detail.push(cb.locMessage("txt.972", "Organization") + " : " + $cbfind("#DIV_SRCH #CMB_CNTR_CD").cbText() + " / " + $cbfind("#DIV_SRCH #CMB_GRP_CD").cbText() + " / " + $cbfind("#DIV_SRCH #CMB_TEAM_CD").cbText());
        
        var header = {};
        header.exportParam = {};
        header.exportParam.programId = GV_PGM.programId;
        header.exportParam.fileName = gfn_getProgramTitle(GV_PGM.programId, "_") + "_" + CB.today();
        header.exportParam.title = gfn_getProgramTitle(GV_PGM.programId);
        //header.exportParam.strDate = $cbfind("#DIV_SRCH #SRCH_STR_DT").cbText();
        //header.exportParam.endDate = $cbfind("#DIV_SRCH #SRCH_END_DT").cbText();
        header.exportParam.strDate = $cbfind("#DIV_SRCH #SRCH_YM").cbText();
        header.exportParam.format = "pdf";
        header.exportParam.target = $cbwrap.cbSpread("#GRD_RPT");
        header.exportParam.detail = detail;
        
        data.SELECT_TEAM_PERFORMANCE = corebase.Input("selectList", "CRPT3019.SELECT_TEAM_PERFORMANCE", source, header); // select query
        
        options.method = type;//"exportExcel", "exportReport";
        options.data = data;
        
        corebase.ajax(options);
    }
    
    // datepicker from~to setting
    function fn_checkDatePicker(dtpFrom, dtpTo, type) {
        var today = CB.today();
        var d = new Date(today.substring(0,4)+'/'+today.substring(4,6)+'/'+today.substring(6,8));
        switch (type) {
        case "W" :
            dtpFrom.cbVal(new Date(d.getFullYear(), d.getMonth(), 1));
            dtpTo.cbVal(new Date(d.getFullYear(), d.getMonth() + 1, 0));
            break;
        case "M" :
            dtpFrom.cbVal(new Date(d.getFullYear(), d.getMonth()-1, 1));
            dtpTo.cbVal(new Date(d.getFullYear(), d.getMonth(), 0));
            break;
        default :
            CBMsg.error(cb.locMessage("msg.295", "You entered a wrong information."));
        }
    }
    
    // set dates as first and last day of the picked month
    function fn_setDate(date) {
        var d = new Date(date.substring(0,4)+'/'+date.substring(4,6)+'/'+date.substring(6,8));
        var firstDay = new Date(d.getFullYear(), d.getMonth(), 1);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0);
       
        $cbfind("#SRCH_STR_DT").cbVal(firstDay);
        $cbfind("#SRCH_END_DT").cbVal(lastDay);
    }
});