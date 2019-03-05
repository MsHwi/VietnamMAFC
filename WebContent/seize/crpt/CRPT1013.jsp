<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase" %>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr" %>
<cb:info>
<!-- 
 // ***********************************************************************************************
 // Program Name : [CRPT1013] O/B Performance
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2018. 03. 14
 // Description  : O/B Performance
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
<cb:pageWrapper title="O/B Performance" id="CRPT1013" plugin="datepicker,grid,multicombo" pageType="">

    <jsp:attribute name="headWrapper"></jsp:attribute>
    <jsp:attribute name="bodyWrapper">
    
    <!--SearchArea-->
    <span class="Srchline"></span>
    <div class="SrchDiv" id="DIV_SRCH">
        <table cellspacing="0" class="SrchTBL">
            <colgroup>
                <col style="width:100px" />
                <col style="width:50%" />
                <col style="width:100px" />
                <col style="width:30%" />
                <col style="width:205px" />
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row" title=""><cbt:message code="txt.1326" text="Query Period" /></th>
                    <td>
                        <cb:datepicker id="SRCH_STR_DT"
                                       data-option="type:datepicker;dvalue:today-7d"
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
                            <input name="SRCH_RD_DT" type="radio" value="P" id="c1" class="i_radio" /> <label for="c1"><cbt:message code="txt.1280" text="Yesterday" /></label> 
                            <input name="SRCH_RD_DT" type="radio" value="T" id="c2" class="i_radio" /> <label for="c2"><cbt:message code="txt.729" text="Day" /></label> 
                            <input name="SRCH_RD_DT" type="radio" value="W" id="c3" class="i_radio" checked="checked"/> <label for="c3"><cbt:message code="txt.1222" text="Week" /></label> 
                            <input name="SRCH_RD_DT" type="radio" value="M" id="c4" class="i_radio" /> <label for="c4"><cbt:message code="txt.1406" text="Month" /></label> 
                        </div> 
                    </td>
                    <th scope="row" title=""><cbt:message code="txt.1428" text="Campaign" /></th>
                    <td>
                        <cbt:combo code="selectList:CRPT1013.SELECT_CMP" name="CMP_ID" id="CMP_ID" codeType="multi" data-option="event:init;top:ALL" data-io="IO" style="width:100%;" />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row" title=""><cbt:message code="txt.972" text="Organization" /></th>
                    <td colspan="3">
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_CNTR_CD" data-option="event:init;type:dept-cntr;top:ALL"                             data-io="IO" style="width:23%;" />
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_GRP_CD"  data-option="event:init;type:dept-grp;top:ALL"  data-parent="#CMB_CNTR_CD"  data-io="IO" style="width:23%;" />
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_TEAM_CD" data-option="event:init;type:dept-team;top:ALL" data-parent="#CMB_GRP_CD"   data-io="IO" style="width:23%;" />
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_USR_ID"  data-option="event:init;type:dept-user;top:ALL" data-parent="#CMB_TEAM_CD"  data-io="IO" style="width:29.8%;" />
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
                            <cb:grid-column id="CNTR_NM"        width="100px"   rowspan="2" data-column="align:center;"><cbt:message code="txt.1021" text="Center" /></cb:grid-column>
                            <cb:grid-column id="GRP_NM"         width="100px"   rowspan="2" data-column="align:center;"><cbt:message code="txt.656"  text="Group" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"        width="100px"   rowspan="2" data-column="align:center;"><cbt:message code="txt.1502" text="Team" /></cb:grid-column>
<%--                             <cb:grid-column id="CNSLR_ID"      	width="100px"   rowspan="2" data-column="align:center;"><cbt:message code="txt.949"  text="Agent ID" /></cb:grid-column> --%>
                            <cb:grid-column id="USR_NM"         width="200px"   rowspan="2" data-column="align:left;"><cbt:message code="txt.950"  text="Agent Name" /></cb:grid-column>
                            <cb:grid-column id="CMP_NM"         width="200px"   rowspan="2" data-column="align:left"><cbt:message code="txt.1428" text="Campaign" /></cb:grid-column>
                            <cb:grid-column id="ASG_CNT"        width="100px"   rowspan="2" data-column="align:right;type:number;"><cbt:message code="txt.854"  text="#Assigned" /></cb:grid-column>
                            <cb:grid-column id=""               width="700px"   colspan="4" data-column="align:center;"><cbt:message code="txt.2196" text="Main Consult" /></cb:grid-column>
                            <cb:grid-column id=""               width="700px"   colspan="4" data-column="align:center;"><cbt:message code="txt.749" text="Loan Status" /></cb:grid-column>
                        </tr>
                        <tr>
                            <cb:grid-column id="TYP_TS10"       width="120px"   data-column="align:right;type:number;"><cbt:message code="txt.2114" text="#Generate to lead" /></cb:grid-column>
                            <cb:grid-column id="TYP_TS30"       width="100px"   data-column="align:right;type:number;"><cbt:message code="txt.1932" text="Calling" /></cb:grid-column>
                            <cb:grid-column id="TYP_TS20"       width="100px"   data-column="align:right;type:number;"><cbt:message code="txt.1958" text="Closed data" /></cb:grid-column>
                            <cb:grid-column id="NOT_CALL"       width="100px"   data-column="align:right;type:number;"><cbt:message code="txt.2232" text="Not called yet" /></cb:grid-column>
                            <cb:grid-column id="APP"            width="100px"   data-column="align:right;type:number;"><cbt:message code="txt.1863" text="App" /></cb:grid-column>
                            <cb:grid-column id="APPROVED"       width="100px"   data-column="align:right;type:number;"><cbt:message code="txt.1884" text="Approved" /></cb:grid-column>
                            <cb:grid-column id="DISBURSED"      width="100px"   data-column="align:right;type:number;"><cbt:message code="txt.2055" text="Disburbed" /></cb:grid-column>
                            <cb:grid-column id="AMTFIN"         width="100px"   data-column="align:right;type:number;"><cbt:message code="txt.2177" text="Loan Amount" /></cb:grid-column>
                        </tr>
                    </thead>
                </table>
            </cb:grid>
        </article>
    </section>
    
    <script type="text/javascript" charset="utf-8" src="/seize/crpt/CRPT1013.js"></script>
    
    </jsp:attribute>
</cb:pageWrapper>
