<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase"%>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr"%>
<cb:info>
	<!-- 
 // ***********************************************************************************************
 // Program Name : [CRPT3012] STATUS OF RECEIVING LOAN DOCUMENTS 
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2018. 03. 19
 // Description  : STATUS OF RECEIVING LOAN DOCUMENTS
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
<cb:pageWrapper title="Status of Receiving Loan Documents" id="CRPT3012" plugin="datepicker,grid" pageType="">
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
                <col style="width:" />
            </colgroup>
            <tbody>	
            	 <tr>
                    <th scope="row" title="" class="issue"><cbt:message code="txt.1326" text="Query Period" /></th>
                    <td>
                        <cb:datepicker id="SRCH_YM" data-option="type:datepickerYM;dvalue:todayYM" data-io="IO" data-valid="maxlength:8;" class="point"/>
                    </td>
                    <th scope="row" title=""><cbt:message code="txt.1428" text="Campaign" /></th>
                    <td><cbt:combo code="selectList:CRPT1012.SELECT_CMP" name="CMB_CMP_CD" id="CMB_CMP_CD"  data-option="event:init;top:ALL"  data-io="IO" style="width:100%;" codeType="ALL"/></td>
                </tr>
                <tr>
                    <th scope="row" title=""><cbt:message code="txt.972" text="Organization" /></th>
                    <td colspan="3">
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_CNTR_CD" data-option="event:init;type:dept-cntr;top:ALL" data-name="txt.1021:Center"  data-io="IO" style="width:23%;" data-valid="require;"/>
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_GRP_CD"  data-option="event:init;type:dept-grp;top:ALL"  data-parent="#CMB_CNTR_CD" data-io="IO" style="width:23%;" />
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_TEAM_CD" data-option="event:init;type:dept-team;top:ALL" data-parent="#CMB_GRP_CD"  data-io="IO" style="width:23%;" />
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_USR_ID"  data-option="event:init;type:dept-user;top:ALL" data-parent="#CMB_TEAM_CD" data-io="IO" style="width:29.5%;" />
                    </td>
                    <td class="btn">
                        <cb:button type="button" id="BTN_EXCEL" value="" class="btn_WF_excel" title="Excel" hidden="hidden"><cbt:message code="txt.1118" text="Excel" /></cb:button>
                        <cb:button type="button" id="BTN_PDF" value="" class="btn_WF_pdf" title="PDF" hidden="hidden"><cbt:message code="txt.1658" text="PDF" /></cb:button>
                        <cb:button type="button" id="BTN_SRCH" value="" title="Query" class="btn_WF_srch"><cbt:message code="txt.1324" text="Query" /></cb:button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!--//SearchArea-->
	
	<!-- Grid Area -->
	<section style="position:absolute; top:65px; right:0; left:0; bottom:0;">
		<!--Grid-->
	        <article class="gridArea">
	            <cb:grid style=" position:absolute; top:0px; bottom:30px; width:100%;" data-option="type:spread">
	                <table id="GRD_RPT" class="spread" data-spread="operationmode:3;scrollbars:virtual;pagesize:20;rownum:0;">
	                    <thead>
	                        <tr>
	                            <cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" rowspan="3"><cbt:message code="txt.628" text="Div." /></cb:grid-column>
	                            <cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="8"><cbt:message code="txt.2107" text="FOLLOWING" /></cb:grid-column>
	                            <cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="6"><cbt:message code="txt.1961" text="COLLECTED" /></cb:grid-column>
	                            <cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="8"><cbt:message code="txt.2093" text="FAILED" /></cb:grid-column>
	                            <cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2" rowspan="2"><cbt:message code="txt.1282" text="TOTAL" /></cb:grid-column>
	                        </tr>
	                        <tr>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.2254" text="PENDING" /></cb:grid-column>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.2356" text="RE-SCHEDULED" /></cb:grid-column>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.1982" text="CONSIDERING" /></cb:grid-column>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.1282" text="TOTAL" /></cb:grid-column>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.2112" text="FULL" /></cb:grid-column>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.2331" text="QDE" /></cb:grid-column>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.1282" text="TOTAL" /></cb:grid-column>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.1943" text="CANT CONTACT" /></cb:grid-column>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.1942" text="CANCELLED" /></cb:grid-column>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.1944" text="CANT PROVIDE DOCUMENTS" /></cb:grid-column>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.1282" text="TOTAL" /></cb:grid-column>	                        		                        		                        	
	                        </tr>
	                        <tr>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;">%</cb:grid-column>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;">%</cb:grid-column>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;">%</cb:grid-column>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;">%</cb:grid-column>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;">%</cb:grid-column>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;">%</cb:grid-column>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;">%</cb:grid-column>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;">%</cb:grid-column>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;">%</cb:grid-column>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;">%</cb:grid-column>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;">%</cb:grid-column>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;">%</cb:grid-column>                            
	                        </tr>
	                    </thead>
	                </table>
	            </cb:grid>
	        </article>
	    </section>
    <!--//GridArea-->
    
        <script type="text/javascript" charset="utf-8" src="/seize/crpt/CRPT3012.js"></script>
    
    </jsp:attribute>
</cb:pageWrapper>
