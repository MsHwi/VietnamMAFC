<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase" %>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr" %>
<cb:info>
<!-- 
 // ***********************************************************************************************
 // Program Name : [CRPT1020] Lead Send to DC / SIP Admin Report
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2018. 03. 21
 // Description  : Complaint Management Report Screen
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
<cb:pageWrapper title="Lead Send to DC / SIP Admin Report" id="CRPT1020" plugin="datepicker,grid,multicombo" pageType="">

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
                    <col style="width:100px" />
                    <col style="width:" />
                    <col style="width:8px" />
            </colgroup>
            
            <tbody> 
                <tr>
                    <th scope="row" title="" class="issue"><cbt:message code="txt.1326" text="Query Period" /></th>
                    <td colspan="3">
                        <input type="text" id="SRCH_STR_DT" data-option="type:datepicker;dvalue:today-7d" data-valid="maxlength:8;" data-io="IO" class="point" />
                        <span>-</span>
                        <input type="text" id="SRCH_END_DT" data-option="type:datepicker;dvalue:today" data-valid="maxlength:8;" data-io="IO" class="point" />
                        <div class="item inline">
                            <input name="SRCH_RD_DT" type="radio" value="P" id="c1" class="i_radio" /> <label for="c1"><cbt:message code="txt.1280" text="Yesterday" /></label>
                            <input name="SRCH_RD_DT" type="radio" value="T" id="c2" class="i_radio" /> <label for="c2"><cbt:message code="txt.729" text="Day" /></label>
                            <input name="SRCH_RD_DT" type="radio" value="W" id="c3" class="i_radio" checked="checked" /> <label for="c3"><cbt:message code="txt.1222" text="Week" /></label>
                            <input name="SRCH_RD_DT" type="radio" value="M" id="c4" class="i_radio" /> <label for="c4"><cbt:message code="txt.1406" text="Month" /></label>
                        </div>
                    </td>
                    <th scope="row" title=""><cbt:message code="txt.1428" text="Campaign" /></th>
                    <td><cbt:combo code="selectList:CRPT1020.SELECT_CMP" name="" id="CMB_CMP_CD"  data-option="event:init;top:ALL" codeType="multi" data-io="IO" style="width:100%;" /></td>
                    <th scope="row" title=""><cbt:message code="txt.1701" text="Status" /></th>  
                    <td><cbt:combo code="selectList:CRPT1020.SELECT_STT" name="" id="CMB_STT_CD"  data-option="event:init;top:ALL" codeType="multi" data-io="IO" style="width:100%;" /></td>                    
                </tr>
                <tr>
                    <th scope="row" title=""><cbt:message code="txt.1021" text="Center" /></th>
                    <td><cbt:combo code="" name="CMB_CNTR" id="CMB_CNTR_CD" data-option="event:init;type:dept-cntr;top:ALL"                             data-io="IO" style="width:100%;" /></td>
                    <th scope="row" title=""><cbt:message code="txt.656" text="Group" /></th>
                    <td><cbt:combo code="" name="CMB_CNTR" id="CMB_GRP_CD"  data-option="event:init;type:dept-grp;top:ALL"  data-parent="#CMB_CNTR_CD"  data-io="IO" style="width:100%;" /></td>
                    <th scope="row" title=""><cbt:message code="txt.1502" text="Team" /></th>
                    <td><cbt:combo code="" name="CMB_CNTR" id="CMB_TEAM_CD" data-option="event:init;type:dept-team;top:ALL" data-parent="#CMB_GRP_CD"   data-io="IO" style="width:100%;" /></td>
                    <th scope="row" title=""><cbt:message code="txt.2366" text="Router" /></th>
                    <td><cbt:combo code="selectList:CRPT1020.SELECT_RTR" name="" id="CMB_RTR_CD" data-option="event:init;top:ALL" codeType="multi" data-io="IO" style="width:100%;" /></td>                                       
                 </tr>
                <tr>
                    <td class="btn" colspan="9">
                        <button type="button" id="BTN_EXCEL" value="" class="btn_WF_excel" title="Excel" hidden="hidden"><cbt:message code="txt.1118" text="Excel" /></button>
                        <button type="button" id="BTN_PDF"   value="" class="btn_WF_pdf" title="PDF" hidden="hidden"><cbt:message code="txt.1658" text="PDF" /></button>
                        <button type="button" id="BTN_SRCH"  value="" title="Query" class="btn_WF_srch"><cbt:message code="txt.1324" text="Query" /></button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!--//SearchArea-->
    
    <!--GridArea-->
    <section style="position:absolute; top:94px; right:0; left:0; bottom:0;">
        <!--Grid-->
        <article class="gridArea">
            <cb:grid style=" position:absolute; top:0px; bottom:30px; width:100%;" data-option="type:spread">
                <table id="GRD_RPT" class="spread" data-spread="operationmode:3;scrollbars:virtual;pagesize:20;">
                    <thead>
                        <tr>
                            <cb:grid-column id="CMP_NM"          width="200px"    data-io="IO" data-column="align:left;"><cbt:message code="txt.1428" text="Campaign" /></cb:grid-column>
                            <cb:grid-column id="TEAM"            width="150px"    data-io="IO" data-column="align:left;"><cbt:message code="txt.1502" text="Team" /></cb:grid-column>
                            <cb:grid-column id="AGEN_CDNM"       width="200px"    data-io="IO" data-column="align:left;"><cbt:message code="txt.947" text="Agent" /></cb:grid-column>
                            <cb:grid-column id="LEAD_TOT"        width="100px"    data-io="IO" data-column="align:right;type:number;"><cbt:message code="txt.2448" text="Total Lead" /></cb:grid-column>
                            <cb:grid-column id="DC_SIP_ADMN_TOT" width="100px"    data-io="IO" data-column="align:right;type:number;"><cbt:message code="txt.2457" text="Total Sent to" /></br><cbt:message code="txt.2028" text="DC / Sip Admin" /></cb:grid-column>
                            <cb:grid-column id="FINNONE_TOT"     width="100px"    data-io="IO" data-column="align:right;type:number;"><cbt:message code="txt.2457" text="Total Sent to" /></br><cbt:message code="txt.2099" text="FINNONE" /></cb:grid-column>
                            <cb:grid-column id="RFS_FINNONE_TOT" width="100px"    data-io="IO" data-column="align:right;type:number;"><cbt:message code="txt.2608" text="Total Refuse" /></br><cbt:message code="txt.2099" text="FINNONE" /></cb:grid-column>
                        </tr>
                    </thead>
                </table>
            </cb:grid>
        </article>
    </section>
    <!--//GridArea-->
    
    <script type="text/javascript" charset="utf-8" src="/seize/crpt/CRPT1020.js"></script>
    
    </jsp:attribute>
</cb:pageWrapper>
