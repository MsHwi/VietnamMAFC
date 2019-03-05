<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase" %>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr" %>
<cb:info>
<!-- 
 // ***********************************************************************************************
 // Program Name : [CRPT3021] Report Telesales manager team
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
<cb:pageWrapper title="Report Telesales manager team" id="CRPT3021" plugin="datepicker,grid" pageType="">

    <jsp:attribute name="headWrapper"></jsp:attribute>
    <jsp:attribute name="bodyWrapper">
    
    <!--SearchArea-->
    <span class="Srchline"></span>
    <div class="SrchDiv" id="DIV_SRCH">
        <table cellspacing="0" class="SrchTBL">
            <colgroup>
                <col style="width:100px" />
                <col style="width:230px" />
                <col style="width:121px" />
                <col style="width:18%" />
                <col style="width:90px" />
                <col style="width:18%" />
                <col style="width:100px" />
                <col style="width:18%" />
                <col style="width:8px" />
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row" title=""><cbt:message code="txt.678" text="Date" /></th>
                    <td>
                        <cb:datepicker id="SRCH_STR_DT" data-option="type:datepicker;dvalue:today-7d" data-valid="maxlength:8;" data-io="IO" class="point" />
                        <span>-</span>
                        <cb:datepicker id="SRCH_END_DT" data-option="type:datepicker;dvalue:today" data-valid="maxlength:8;" data-io="IO" class="point"/>                    
                       <div class="item inline">
                           <input name="SRCH_RD_DT" type="radio" value="P" id="c1" class="i_radio" /> <label for="c1"><cbt:message code="txt.1280" text="Yesterday" /></label>
                           <input name="SRCH_RD_DT" type="radio" value="T" id="c2" class="i_radio" /> <label for="c2"><cbt:message code="txt.729" text="Day" /></label>
                           <input name="SRCH_RD_DT" type="radio" value="W" id="c3" class="i_radio" checked="checked"/> <label for="c3"><cbt:message code="txt.1222" text="Week" /></label>
                           <input name="SRCH_RD_DT" type="radio" value="M" id="c4" class="i_radio" /> <label for="c4"><cbt:message code="txt.1406" text="Month" /></label>
                       </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" title=""><cbt:message code="txt.972" text="Organization" /></th>
                    <td colspan="5">
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_CNTR_CD" data-option="event:init;type:dept-cntr;top:ALL"                             data-io="IO" style="width:25%;" />
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_GRP_CD"  data-option="event:init;type:dept-grp;top:ALL"  data-parent="#CMB_CNTR_CD"  data-io="IO" style="width:25%;" />
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_TEAM_CD" data-option="event:init;type:dept-team;top:ALL" data-parent="#CMB_GRP_CD"   data-io="IO" style="width:24%;" />
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_USR_ID"  data-option="event:init;type:dept-user;top:ALL" data-parent="#CMB_TEAM_CD"  data-io="IO" style="width:24.5%;" />
                    </td>
                    <td class="btn" colspan="3">
                        <button type="button" id="BTN_EXCEL" value="" class="btn_WF_excel" title="Excel" hidden="hidden"><cbt:message code="txt.1118" text="Excel" /></button>
                        <button type="button" id="BTN_PDF" value="" class="btn_WF_pdf" title="PDF" hidden="hidden"><cbt:message code="txt.1658" text="PDF" /></button>
                        <button type="button" id="BTN_SRCH" value="" title="Query" class="btn_WF_srch"><cbt:message code="txt.1324" text="Query" /></button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!--//SearchArea-->
    
    <!--GridArea-->
    <section style="position:absolute; top:70px; right: 0; bottom:0; left:0;">
        <!--Grid-->
        <article class="gridArea">
            <cb:grid style=" position:absolute; top:0; bottom:30px; width:100%;" data-option="type:spread">
                <table id="GRD_RPT" class="spread" data-spread="operationmode:3;scrollbars:virtual;pagesize:20;">
                    <thead>
                        <tr>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;" rowspan="2"><cbt:message code="txt.1021" text="Center" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;" rowspan="2"><cbt:message code="txt.656" text="Group" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;" rowspan="2"><cbt:message code="txt.1502" text="Team" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;" rowspan="2"><cbt:message code="txt.938" text="Agent ID" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;" rowspan="2"><cbt:message code="txt.724" text="Agent" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;" rowspan="2"><cbt:message code="txt.2029" text="DC Code" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;" rowspan="2"><cbt:message code="txt.1865" text="App Day" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;" rowspan="2"><cbt:message code="txt.2450" text="Total login" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;" colspan="2"><cbt:message code="txt.2035" text="DDE" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;" colspan="2"><cbt:message code="txt.2467" text="UND" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;" colspan="2"><cbt:message code="txt.1998" text="CRS" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;" colspan="4"><cbt:message code="txt.2053" text="Disb number Loan amount" /></cb:grid-column>                                                       
                        </tr>
                        <tr>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;"><cbt:message code="txt.2254" text="Pending" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;"><cbt:message code="txt.1941" text="Cancel/Reject" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;"><cbt:message code="txt.2254" text="Pending" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;"><cbt:message code="txt.1941" text="Cancel/Reject" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;"><cbt:message code="txt.2254" text="Pending" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;"><cbt:message code="txt.1941" text="Cancel/Reject" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;"><cbt:message code="txt.2182" text="Loan Inssurance" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;"><cbt:message code="txt.2227" text="No Loan Inssurance" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;"><cbt:message code="txt.2182" text="Loan Inssurance" /></cb:grid-column>
                            <cb:grid-column id="TEAM_NM"    width="100px"   data-column="align:center;"><cbt:message code="txt.2227" text="No Loan Inssurance" /></cb:grid-column>
                        </tr>
                    </thead>
                </table>
            </cb:grid>
        </article>
    </section>
    
    <script type="text/javascript" charset="utf-8" src="/seize/crpt/CRPT3021.js"></script>
    
    </jsp:attribute>
</cb:pageWrapper>
