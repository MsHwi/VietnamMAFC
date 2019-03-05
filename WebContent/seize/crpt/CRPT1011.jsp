<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase" %>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr" %>
<cb:info>
<!-- 
 // ***********************************************************************************************
 // Program Name : [CRPT1011] O/B Daily Call Report
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
<cb:pageWrapper title="Daily Call Report" id="CRPT1011" plugin="datepicker,grid" pageType="">

    <jsp:attribute name="headWrapper"></jsp:attribute>
    <jsp:attribute name="bodyWrapper">
    
    <!--SearchArea-->
    <span class="Srchline"></span>
    <div class="SrchDiv" id="DIV_SRCH">
        <table cellspacing="0" class="SrchTBL">
           <colgroup>
                <col style="width:100px" />
                <col style="width:30%" />
                <col style="width:100px" />
                <col style="width:30%" />
                <col style="width:100px" />
                <col style="width:40%" />
                <col style="width:205px" />
            </colgroup>
            
            <tbody> 
                <tr>
                    <th scope="row" title="" class="issue"><cbt:message code="txt.1219" text="Date" /></th>
                    <td colspan="3">
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
                    <th scope="row" title=""><cbt:message code="txt.1428" text="Campaign" /></th>
                    <td><cbt:combo code="selectList:CRPT1011.SELECT_CMP" name="" id="CMB_CMP_CD" codeType="ALL" data-option="event:init;top:ALL"  data-io="IO" style="width:100%;"/></td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row" title=""><cbt:message code="txt.1021" text="Center" /></th>
                    <td><cbt:combo code="" name="CMB_CNTR" id="CMB_CNTR_CD" data-option="event:init;type:dept-cntr;top:ALL"                             data-io="IO" style="width:100%;" /></td>
                    <th scope="row" title=""><cbt:message code="txt.656" text="Group" /></th>
                    <td><cbt:combo code="" name="CMB_CNTR" id="CMB_GRP_CD"  data-option="event:init;type:dept-grp;top:ALL"  data-parent="#CMB_CNTR_CD"  data-io="IO" style="width:100%;" /></td>
                    <th scope="row" title=""><cbt:message code="txt.1502" text="Team" /></th>
                    <td><cbt:combo code="" name="CMB_CNTR" id="CMB_TEAM_CD" data-option="event:init;type:dept-team;top:ALL" data-parent="#CMB_GRP_CD"   data-io="IO" style="width:100%;" /></td>               
                    <td class="btn">
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
    <section style="position:absolute; top:70px; right: 0; bottom:0; left:0;">
        <!--Grid-->
        <article class="gridArea">
            <cb:grid style=" position:absolute; top:0; bottom:30px; width:100%;" data-option="type:spread">
                <table id="GRD_RPT" class="spread" data-spread="operationmode:3;scrollbars:virtual;pagesize:20;">
                    <thead>
                        <tr>
                            <cb:grid-column id="AGEN_NM"    width="200px"   data-column="align:left;"><cbt:message code="txt.950" text="Agent Name" /></cb:grid-column>                            
                            <cb:grid-column id="FRSH_DATA"	width="100px"   data-column="align:right;type:number"><cbt:message code="txt.2109" text="Fresh Data" /></br>(<cbt:message code="txt.2230" text="not call ever" />)</cb:grid-column>                            
                            <cb:grid-column id="WIP_DATA"   width="100px"   data-column="align:right;type:number"><cbt:message code="txt.2479" text="Wip Data" /></br>(<cbt:message code="txt.1931" text="called connect before" />)</cb:grid-column>
                            <cb:grid-column id="TLKTM_TOT"	width="100px"   data-column="align:right;type:number"><cbt:message code="txt.2406" text="TalkTime Total" /></cb:grid-column>
                            <cb:grid-column id="AVG_DURT"   width="100px"   data-column="align:right;type:number"><cbt:message code="txt.1905" text="Average duration" /></cb:grid-column>
                            <cb:grid-column id="NO_CONN"    width="100px"   data-column="align:right;type:number"><cbt:message code="txt.2226" text="No Connect" /></cb:grid-column>
                            <cb:grid-column id="CALL_TOT"   width="100px"   data-column="align:right;type:number"><cbt:message code="txt.1402" text="Total Call" /></cb:grid-column>
                        </tr>
                    </thead>
                </table>
            </cb:grid>
        </article>
    </section>
    <!--//GridArea-->
    
    <script type="text/javascript" charset="utf-8" src="/seize/crpt/CRPT1011.js"></script>
    
    </jsp:attribute>
</cb:pageWrapper>
