<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase" %>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr" %>
<cb:info>
<!-- 
 // ***********************************************************************************************
 // Program Name : [CRPT2011] Daily Agent Performance Report
 // Creator      : jekalhg@buttle.co.kr
 // Create Date  : 2018. 03. 14
 // Description  : Daily Agent Performance Report Screen
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
<cb:pageWrapper title="Daily Agent Performance Report" id="CRPT2011" plugin="datepicker,grid" pageType="">

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
                    <th scope="row" title="" class="issue"><cbt:message code="txt.1219" text="Date" /></th>
                    <td colspan="6">
                        <cb:datepicker id="SRCH_DT"
                                       data-option="type:datepicker;dvalue:today"
                                       data-valid="maxlength:8;"
                                       data-io="IO"
                                       class="point" />
                        <div class="item inline">
                            <input name="SRCH_RD_DT" type="radio" value="P" id="c1" class="i_radio" /> <label for="c1"><cbt:message code="txt.1280" text="Yesterday" /></label>
                            <input name="SRCH_RD_DT" type="radio" value="T" id="c2" class="i_radio" checked="checked"/> <label for="c2"><cbt:message code="txt.729" text="Day" /></label>
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
    
    <!--GridArea-->
    <section style="position:absolute; top:70px; right:0; bottom:0; left:0;">
        <!--Grid-->
        <article class="gridArea">
            <cb:grid style=" position:absolute; top:0; bottom:30px; width:100%;" data-option="type:spread">
                <table id="GRD_RPT" class="spread" data-spread="operationmode:3;scrollbars:virtual;pagesize:20;">
                    <thead>
                        <tr>
                            <cb:grid-column id="AGEN_NM"        width="300px"    data-io="IO" data-column="align:left;"><cbt:message code="txt.950" text="Agent Name" /></cb:grid-column>
                            <cb:grid-column id="ACTL_STFF_TM"   width="135px"    data-io="IO" data-column="align:right;type:number;"><cbt:message code="txt.1841" text="Actual Staffed Time" /></cb:grid-column>
                            <cb:grid-column id="ANSW_CALL"      width="115px"    data-io="IO" data-column="align:right;type:number;"><cbt:message code="txt.1862" text="Answered Calls" /></cb:grid-column>
                            <cb:grid-column id="EXT_CALL"       width="105px"    data-io="IO" data-column="align:right;type:number;"><cbt:message code="txt.2088" text="Ext. Out Calls" /></cb:grid-column>
                            <cb:grid-column id="AVG_HNDL_TM"    width="135px"    data-io="IO" data-column="align:right;type:number;"><cbt:message code="txt.1906" text="Avg. Handling Time" /></cb:grid-column>
                            <cb:grid-column id="TOT_RDY_TM"     width="125px"    data-io="IO" data-column="align:right;type:number;"><cbt:message code="txt.2454" text="Total Ready Time" /></cb:grid-column>
                            <cb:grid-column id="TOT_TLK_TM"     width="110px"    data-io="IO" data-column="align:right;type:number;"><cbt:message code="txt.2458" text="Total Talk Time" /></cb:grid-column>
                            <cb:grid-column id="TOT_ACT_TM"     width="120px"    data-io="IO" data-column="align:right;type:number;"><cbt:message code="txt.2437" text="Total ACW Time" /></cb:grid-column>
                            <cb:grid-column id="TOT_RST_TM"     width="110px"    data-io="IO" data-column="align:right;type:number;"><cbt:message code="txt.2456" text="Total Rest Time" /></cb:grid-column>
                            <cb:grid-column id="TOT_MEAL_TM"    width="110px"    data-io="IO" data-column="align:right;type:number;"><cbt:message code="txt.2451" text="Total Meal Time" /></cb:grid-column>
                            <cb:grid-column id="TOT_METI_TM"    width="130px"    data-io="IO" data-column="align:right;type:number;"><cbt:message code="txt.2452" text="Total Meeting Time" /></cb:grid-column>
                            <cb:grid-column id="TOT_TRNG_TM"    width="130px"    data-io="IO" data-column="align:right;type:number;"><cbt:message code="txt.2459" text="Total Training Time" /></cb:grid-column>
                        </tr>
                    </thead>
                </table>
            </cb:grid>
        </article>
    </section>
    <!--//GridArea-->
    
    <script type="text/javascript" charset="utf-8" src="/seize/crpt/CRPT2011.js"></script>
    </jsp:attribute>
</cb:pageWrapper>
