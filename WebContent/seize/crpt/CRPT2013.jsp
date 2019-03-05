<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase" %>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr" %>
<cb:info>
<!-- 
 // ***********************************************************************************************
 // Program Name : [CRPT2013] I/B Monthly Call Report
 // Creator      : jekalhg@buttle.co.kr
 // Create Date  : 2018. 03. 14
 // Description  : I/B Monthly Call Report Screen
 // Modify Desc  : 
 // -----------------------------------------------------------------------------------------------
 // Date         | Updater        | Remark
 // -----------------------------------------------------------------------------------------------
 //     
 //        
 // ***********************************************************************************************/
-->
</cb:info>

<%// Plugins : grid,tab,datepicker,treeview - Use Keyword + "," %>
<cb:pageWrapper title="Monthly Call Report" id="CRPT2013" plugin="datepicker,grid" pageType="">

    <jsp:attribute name="headWrapper"></jsp:attribute>
    <jsp:attribute name="bodyWrapper">
    
    <!--SearchArea-->
    <span class="Srchline"></span>
    <div class="SrchDiv" id="DIV_SRCH">
        <table cellspacing="0" class="SrchTBL">
            <colgroup>
                <col style="width:100px" />
                <col style="width:" />
                <col style="width:100px" />
                <col style="width:" />
                <col style="width:100px" />
                <col style="width:" />
                <col style="width:205px" />
            </colgroup>
            <tbody>	
            	 <tr>
                    <th scope="row" title="" class="issue"><cbt:message code="txt.1326" text="Query Period" /></th>
                    <td colspan="6">
                        <cb:datepicker id="SRCH_STR_DT"
                                       data-option="type:datepicker;dvalue:today-30d"
                                       data-valid="maxlength:8;"
                                       data-io="IO"
                                       class="point" />
                        <span>-</span>
                        <cb:datepicker id="SRCH_END_DT"
                                       data-option="type:datepicker;dvalue:today"
                                       data-valid="maxlength:8;"
                                       data-io="IO"
                                       class="point" />
                        <div class="item inline">
                            <input name="SRCH_RD_DT" type="radio" value="W" id="c3" class="i_radio" checked="checked" /> <label for="c3"><cbt:message code="txt.2429" text="This month" /></label>
                            <input name="SRCH_RD_DT" type="radio" value="M" id="c4" class="i_radio" /> <label for="c4"><cbt:message code="txt.2160" text="Last Month" /></label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" title=""><cbt:message code="txt.1021" text="Center" /></th>
                    <td>
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_CNTR_CD" data-option="event:init;type:dept-cntr;top:ALL"                             data-io="IO" style="width:100%;" />
                    </td>
                    <th scope="row" title=""><cbt:message code="txt.656" text="Group" /></th>
                    <td>
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_GRP_CD"  data-option="event:init;type:dept-grp;top:ALL"  data-parent="#CMB_CNTR_CD"  data-io="IO" style="width:100%;" />
                    </td>
                    <th scope="row" title=""><cbt:message code="txt.1502" text="Team" /></th>
                    <td>
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_TEAM_CD" data-option="event:init;type:dept-team;top:ALL" data-parent="#CMB_GRP_CD"   data-io="IO" style="width:100%;" />
                    </td>
                    <td class="btn">
                        <cb:button type="button" id="BTN_EXCEL" value="" class="btn_WF_excel" title="Excel" hidden="hidden"><cbt:message code="txt.1118" text="Excel" /></cb:button>
                        <cb:button type="button" id="BTN_PDF"   value="" class="btn_WF_pdf"   title="PDF" hidden="hidden"><cbt:message code="txt.1658" text="PDF" /></cb:button>
                        <cb:button type="button" id="BTN_SRCH"  value="" class="btn_WF_srch"  title="Query" ><cbt:message code="txt.1324" text="Query" /></cb:button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!--//SearchArea-->
    
    <div style="position:absolute; top:70px;">
        <!--Call Info-->
        <section class="area_rel100">
            <!--boxst01-->
            <table id="MMLY_CALL_TOT" class="boxst01">
                <colgroup>
                    <col style="width:10%" />
                    <col style="width:" />
                    <col style="width:10%" />
                    <col style="width:" />
                    <col style="width:12%" />
                    <col style="width:" />
                    <col style="width:10%" />
                    <col style="width:" />
                </colgroup>
                <tbody>
                    <tr>
                         <th><cbt:message code="txt.1405" text="Total Calls" /></th>
                         <td><input id="CALL_TOT" type="text" value="" data-io="IO" data-option="type:number" readonly="readonly" /></td>
                         <th><cbt:message code="txt.1862" text="Answered calls" /></th>
                         <td><input id="CALL_ANS" type="text" value="" data-io="IO" data-option="type:number" readonly="readonly"/></td>
                         <th><cbt:message code="txt.1838" text="Abandoned calls" /></th>
                         <td><input id="CALL_ABD" type="text" value="" data-io="IO" data-option="type:number" readonly="readonly"/></td>
                         <th><cbt:message code="txt.2383" text="Service Level" /></th>
                         <td><input id="SVCE_LVL" type="text" value="" data-io="IO" style="text-align: right;" readonly="readonly"/></td>
                    </tr>
                    <tr>
                        <th><cbt:message code="txt.2209" text="Max of SL" /></th>
                        <td><input id="MAX_SL" type="text" value="" data-io="IO" data-option="type:number" readonly="readonly"/></td>
                        <th><cbt:message code="txt.2212" text="Min of SL" /></th>
                        <td><input id="MON_SL" type="text" value="" data-io="IO" data-option="type:number" readonly="readonly"/></td>
                        <th><cbt:message code="txt.2123" text="Highest total calls" /></th>
                        <td><input id="HGST_TOT_CALL" type="text" value="" data-io="IO" data-option="type:number" readonly="readonly"/></td>
                        <th><cbt:message code="txt.2190" text="Lowest total call" /></th>
                        <td><input id="LWST_TOT_CALL" type="text" value="" data-io="IO" data-option="type:number" readonly="readonly"/></td>
                    </tr>
                    <tr>
                        <th><cbt:message code="txt.1852" text="AHT" /></th>
                        <td><input id="AHT" type="text" value="" data-io="IO" data-option="type:number" readonly="readonly"/></td>
                        <th><cbt:message code="txt.1892" text="ASA" /></th>
                        <td><input id="ASA" type="text" value="" data-io="IO" data-option="type:number" readonly="readonly"/></td>
                        <th><cbt:message code="txt.2189" text="Longest waitting time" /></th>
                        <td><input id="LGST_WAIT" type="text" value="" data-io="IO"data-option="type:number"  readonly="readonly"/></td>
                        <th><cbt:message code="txt.2228" text="No. of callback" /></th>
                        <td><input id="NO_CABACK" type="text" value="" data-io="IO" data-option="type:number" readonly="readonly"/></td>
                    </tr>
                </tbody>
            </table>
            <!--//boxst01-->
        </section>
        <!--//Call Info.-->
    </div>
    
    <!--GridArea-->
    <section style="position:absolute; top:155px; right: 0; bottom:0; left:0;">
        <!--Grid-->
        <article class="gridArea">
            <cb:grid style=" position:absolute; top:0; bottom:30px; width:100%;" data-option="type:spread">
                <table id="GRD_RPT" class="spread" data-spread="operationmode:3;scrollbars:virtual;pagesize:20;">
                    <thead>
                        <tr>
                            <cb:grid-column id="DT"             width="75px"   rowspan="2" data-column="align:center;type:date;"><cbt:message code="txt.1219" text="Date" /></cb:grid-column>
                            <cb:grid-column id="CALL_TOT"       width="80px"   rowspan="2" data-column="align:right;type:number;"><cbt:message code="txt.1405" text="Total Calls" /></cb:grid-column>
                            <cb:grid-column id="CALL_ANS"	    width="80px"   rowspan="2" data-column="align:right;type:number;"><cbt:message code="txt.1861" text="Ans. Calls" /></cb:grid-column>
                            <cb:grid-column id="CALL_ABD"       width="80px"   rowspan="2" data-column="align:right;type:number;"><cbt:message code="txt.1837" text="Aban Calls" /></cb:grid-column>
                            <cb:grid-column id="SVCE_LVL"       width="80px"   rowspan="2" data-column="align:right;type:number;"><cbt:message code="txt.2382" text="Serv. Level" /></br>(%)</cb:grid-column>
                            <cb:grid-column id=""	            width="120px"   colspan="2" data-column="align:right;"><cbt:message code="txt.2355" text="Require Info." /></cb:grid-column>
                            <cb:grid-column id=""               width="120px"   colspan="2" data-column="align:right;"><cbt:message code="txt.1971" text="Complaint" /></cb:grid-column>
                            <cb:grid-column id=""               width="120px"   colspan="2" data-column="align:right;"><cbt:message code="txt.2245" text="Other" /></cb:grid-column>
                            <cb:grid-column id=""               width="120px"    colspan="2" data-column="align:right;"><cbt:message code="txt.2376" text="Self-Service" /></cb:grid-column>
                            <cb:grid-column id="CABACK_CNT"     width="80px"   rowspan="2" data-column="align:right;type:number"><cbt:message code="txt.2228" text="No. of callback" /></cb:grid-column>
                        </tr>
                        <tr>
                            <cb:grid-column id="RQRE_INFO_ANS"  width="60px"   data-column="align:right;type:number"><cbt:message code="txt.1860" text="Ans." /></cb:grid-column>
                            <cb:grid-column id="RQRE_INFO_ABD"  width="60px"   data-column="align:right;type:number"><cbt:message code="txt.1836" text="Aban" /></cb:grid-column>
                            <cb:grid-column id="COMP_ANS"       width="60px"   data-column="align:right;type:number"><cbt:message code="txt.1860" text="Ans." /></cb:grid-column>
                            <cb:grid-column id="COMP_ABD"       width="60px"   data-column="align:right;type:number"><cbt:message code="txt.1836" text="Aban" /></cb:grid-column>
                            <cb:grid-column id="OTH_ANS"        width="60px"   data-column="align:right;type:number"><cbt:message code="txt.1860" text="Ans." /></cb:grid-column>
                            <cb:grid-column id="OTH_ABD"        width="60px"   data-column="align:right;type:number"><cbt:message code="txt.1836" text="Aban" /></cb:grid-column>
                            <cb:grid-column id="SELF_SVC_ANS"   width="60px"   data-column="align:right;type:number"><cbt:message code="txt.1860" text="Ans." /></cb:grid-column>
                            <cb:grid-column id="SELF_SVC_ABD"   width="60px"   data-column="align:right;type:number"><cbt:message code="txt.1836" text="Aban" /></cb:grid-column>
                        </tr>
                    </thead>
                </table>
            </cb:grid>
        </article>
    </section>
    
    <script type="text/javascript" charset="utf-8" src="/seize/crpt/CRPT2013.js"></script>
    
    </jsp:attribute>
</cb:pageWrapper>
