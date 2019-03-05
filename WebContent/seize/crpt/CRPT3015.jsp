<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase"%>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr"%>
<cb:info>
	<!-- 
 // ***********************************************************************************************
 // Program Name : [CRPT3015] REJECT REASON
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2018. 03. 19
 // Description  : REJECT REASON
 // Modify Desc  : 
 // -----------------------------------------------------------------------------------------------
 // Date         | Updater        | Remark
 // -----------------------------------------------------------------------------------------------
 //     
 //        
 // ***********************************************************************************************/
-->
</cb:info>
<%
	// Plugins : grid,tab,datepicker,treeview - Use Keyword + ","
%>
<cb:pageWrapper title="Reject Reason" id="CRPT3015" plugin="datepicker,grid,multicombo" pageType="">
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
                    <th scope="row" title="" class="issue"><cbt:message code="txt.1326" text="Query Period" /></th>
                    <td><input type="text" id="SRCH_STR_DT" data-option="type:datepickerYM;dvalue:todayYM" data-valid="maxlength:8;" data-io="IO" class="point" />
<!--                     <td colspan="3"> -->
<!--                         <input type="text" id="SRCH_STR_DT" data-option="type:datepicker;dvalue:today-30d" data-valid="maxlength:8;" data-io="IO" class="point" /> -->
<!--                         <span>-</span> -->
<!--                         <input type="text" id="SRCH_END_DT" data-option="type:datepicker;dvalue:today" data-valid="maxlength:8;" data-io="IO" class="point" /> -->
<!--                         <div class="item inline"> -->
<%--                             <input name="SRCH_RD_DT" type="radio" value="P" id="c1" class="i_radio" /> <label for="c1"><cbt:message code="txt.1280" text="Yesterday" /></label> --%>
<%--                             <input name="SRCH_RD_DT" type="radio" value="T" id="c2" class="i_radio" /> <label for="c2"><cbt:message code="txt.729" text="Day" /></label> --%>
<%--                             <input name="SRCH_RD_DT" type="radio" value="W" id="c3" class="i_radio" /> <label for="c3"><cbt:message code="txt.1222" text="Week" /></label> --%>
<%--                             <input name="SRCH_RD_DT" type="radio" value="M" id="c4" class="i_radio" checked="checked" /> <label for="c4"><cbt:message code="txt.1406" text="Month" /></label> --%>
<!--                         </div> -->
                    </td>
                    <th scope="row" title=""><cbt:message code="txt.1428" text="Campaign" /></th>
                    <td><cbt:combo code="selectList:CRPT3015.SELECT_CMP_LIST" name="" id="CMB_ID"  data-option="event:init;top:ALL" codeType="multi" data-io="IO" style="width:100%;" /></td>
                    <th scope="row" title=""><cbt:message code="txt.950" text="Agent Name" /></th>
                    <td><input type="text" id="AGNT_NM" maxlength="100" data-name="txt.950:Agent Name" value="" data-io="IO" /></td>            
                                 
                </tr>
                <tr> 
                    <th scope="row" title=""><cbt:message code="txt.972" text="Organization" /></th>      
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
	
	<!-- Grid Area -->
	<section style="position:absolute; top:70px; right:0; left:0; bottom:0;">      
		<!--Grid-->
	        <article class="gridArea">
	            <cb:grid style=" position:absolute; top:0px; bottom:30px; width:100%;" data-option="type:spread">
	                <table id="GRD_RPT" class="spread" data-spread="operationmode:3;scrollbars:virtual;pagesize:20;rownum:0;">
	                    <thead>
	                        <tr>
	                            <cb:grid-column id=""     width="70px"    data-io="IO" data-column="align:center;" rowspan="2"><cbt:message code="txt.628" text="Div." /></cb:grid-column>
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" colspan="2">1</cb:grid-column>
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" colspan="2">2</cb:grid-column>
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" colspan="2">3</cb:grid-column>
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" colspan="2">4</cb:grid-column>
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" colspan="2">5</cb:grid-column>
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" colspan="2">6</cb:grid-column>
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" colspan="2">7</cb:grid-column>
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.2237" text="NULL" /></cb:grid-column>
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.2116" text="Grand Total" /></cb:grid-column>
	                        </tr>
	                        <tr>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;">%</cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;">%</cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;">%</cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;">%</cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;">%</cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;">%</cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;">%</cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;">%</cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;">%</cb:grid-column>	                            	                                                       
	                        </tr>
	                    </thead>
	                </table>
	            </cb:grid>
	        </article>
	    </section>
    <!--//GridArea-->
    
        <script type="text/javascript" charset="utf-8" src="/seize/crpt/CRPT3015.js"></script>
        
    </jsp:attribute>
</cb:pageWrapper>
