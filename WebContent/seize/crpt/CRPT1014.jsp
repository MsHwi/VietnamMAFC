<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase" %>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr" %>
<cb:info>
<!-- 
 // ***********************************************************************************************
 // Program Name : [CRPT1014] O/B Lead Performance Report
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2018. 03. 14
 // Description  : O/B Lead Performance Report
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
<cb:pageWrapper title="O/B Lead Performance Report" id="CRPT1014" plugin="datepicker,grid,multicombo" pageType="">

    <jsp:attribute name="headWrapper"></jsp:attribute>
    <jsp:attribute name="bodyWrapper">
    
    <!--SearchArea-->
    <span class="Srchline"></span>
    <div class="SrchDiv" id="DIV_SRCH">
        <table cellspacing="0" class="SrchTBL">
            <colgroup>
                <col style="width:100px" />
                <col style="width:30%" />
                <col style="width:140px" />
                <col style="width:16%" />
                <col style="width:140px" />
                <col style="width:16%" />
                <col style="width:205px" />
            </colgroup>
            <tbody>	
            	 <tr>
                    <th scope="row" title=""><cbt:message code="txt.1326" text="Query Period" /></th>
                    <td colspan="3">
                        <cb:datepicker id="SRCH_STR_DT" data-option="type:datepicker;dvalue:today-7d" data-valid="maxlength:8;" data-io="IO" class="point" />
                        <span>-</span>
                        <cb:datepicker id="SRCH_END_DT" data-option="type:datepicker;dvalue:today" data-valid="maxlength:8;" data-io="IO" class="point" />
                        <div class="item inline">
                            <input name="SRCH_RD_DT" type="radio" value="P" id="c1" class="i_radio" /><label for="c1"><cbt:message code="txt.1280" text="Yesterday" /></label> 
                            <input name="SRCH_RD_DT" type="radio" value="T" id="c2" class="i_radio" /><label for="c2"><cbt:message code="txt.729"  text="Day" /></label> 
                            <input name="SRCH_RD_DT" type="radio" value="W" id="c3" class="i_radio" checked="checked"/><label for="c3"><cbt:message code="txt.1222" text="Week" /></label> 
                            <input name="SRCH_RD_DT" type="radio" value="M" id="c4" class="i_radio" /> <label for="c4"><cbt:message code="txt.1406" text="Month" /></label> 
                        </div> 
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row" title=""><cbt:message code="txt.1428" text="Campaign" /></th>
                    <td>
                        <cbt:combo code="selectList:CRPT1014.SELECT_CMP" codeType="multi" id="CMB_CMP_ID" style="width:100%;" data-io="IO" data-option="event:init;" class="point"/>
                    </td>
                    <th><cbt:message code="txt.957" text="Consultation Type" /></th>
                    <td>
                        <cbt:combo code="" id="CMB_CNSL_CD_L" style="width: 100%;" data-io="IO" data-option="event:init;type:cnsl-lv0;top:ALL" />
                    </td>
                    <th><cbt:message code="txt.2195" text="Main Category" /></th>
                    <td>
                        <cbt:combo code="" id="CMB_CNSL_CD_M" style="width: 100%;" data-io="IO" data-option="event:init;type:cnsl-lv1;top:ALL" data-parent="#CMB_CNSL_CD_L"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row" title=""><cbt:message code="txt.972" text="Organization" /></th>
                    <td colspan="5">
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
    <section style="position:absolute; top:90px; right:0; bottom:0; left:0;">
<%--         <h4><cbt:message code="txt.830" text="Result" /></h4> --%>
        <!--Grid-->
        <article class="gridArea">
            <cb:grid style=" position:absolute; top:0; bottom:30px; width:100%;" data-option="type:spread">
                <table id="GRD_RPT" class="spread" data-spread="operationmode:3;scrollbars:virtual;pagesize:20;">
                    <thead>
                        <tr>
                            <cb:grid-column id="CNTR_NM"           width="100px"    data-column="align:left;"><cbt:message code="txt.1021" text="Center" /></cb:grid-column>
                            <cb:grid-column id="GRP_NM"            width="100px"    data-column="align:left;"><cbt:message code="txt.656" text="Group" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"           width="100px"    data-column="align:left;"><cbt:message code="txt.1502" text="Team" /></cb:grid-column>
                            <%-- <cb:grid-column id="CNSLR_ID"          width="100px"    data-column="align:center;"><cbt:message code="txt.938" text="Agent ID" /></cb:grid-column> --%>
                            <cb:grid-column id="CNSLR_NM"          width="200px"    data-column="align:left;"><cbt:message code="txt.950" text="Agent Name" /></cb:grid-column>
                            <cb:grid-column id="CUST_NM"           width="200px"    data-column="align:left;"><cbt:message code="txt.2003" text="Cust Name" /></cb:grid-column>
                            <cb:grid-column id="ASGN_DT"           width="110px"    data-column="align:center;type:date;"><cbt:message code="txt.1898" text="Assigned Date" /></cb:grid-column>
                            <cb:grid-column id="CMP_NM"            width="200px"    data-column="align:left;"><cbt:message code="txt.1428" text="Campaign" /></cb:grid-column>
                            <cb:grid-column id="CNSL_MEDCLAS_NM"   width="180px"    data-column="align:left;"><cbt:message code="txt.2196" text="Main Consult" /></cb:grid-column>
                            <cb:grid-column id="AGREE_ID"          width="100px"    data-column="align:center;"><cbt:message code="txt.2635" text="Old Agree id" /></cb:grid-column>
                            <cb:grid-column id="NEW_AGREE_ID"      width="100px"    data-column="align:center;"><cbt:message code="txt.2636" text="New Agree id" /></cb:grid-column>
                            <cb:grid-column id="LOAN_STATUS"       width="150px"    data-column="align:left;"><cbt:message code="txt.749" text="Loan Status" /></cb:grid-column>
                        </tr>
                    </thead>
                </table>
            </cb:grid>
        </article>
    </section>
    
    <script type="text/javascript" charset="utf-8" src="/seize/crpt/CRPT1014.js"></script>
    
    </jsp:attribute>
</cb:pageWrapper>
