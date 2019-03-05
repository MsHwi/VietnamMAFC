<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase"%>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr"%>
<cb:info>
	<!-- 
 // ***********************************************************************************************
 // Program Name : [CRPT3013] SALES VOLUMN – Application/Disbursement 
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2018. 03. 19
 // Description  : SALES VOLUMN – Application/Disbursement
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
<cb:pageWrapper title="Sales Volumn – Application/Disbursement" id="CRPT3013" plugin="datepicker,grid" pageType="">
	<jsp:attribute name="headWrapper"></jsp:attribute>
	<jsp:attribute name="bodyWrapper">
	
	<!--SearchArea-->
    <span class="Srchline"></span>
    <div class="SrchDiv" id="DIV_SRCH">
        <table cellspacing="0" class="SrchTBL">
            <colgroup>
                <col style="width:100px" />
                <col style="width:60px" />
                <col style="width:200px" />
                <col style="width:60px" />
                <col style="width:" />
            </colgroup>
            <tbody>	
            	 <tr>
                    <th scope="row" title=""><cbt:message code="txt.758" text="Period" /></th>
                    <td>
                        <cb:datepicker id="SRCH_STR_DT"
                                       data-option="type:datepickerY;dvalue:todayy"
                                       data-valid="maxlength:8;"
                                       data-io="IO"
                                       class="point" />
<!--                         <span>-</span> -->
<%--                         <cb:datepicker id="SRCH_END_DT" --%>
<%--                                        data-option="type:datepicker;dvalue:today" --%>
<%--                                        data-valid="maxlength:8;" --%>
<%--                                        data-io="IO" --%>
<%--                                        class="point" /> --%>
<!-- 						<div class="item inline"> -->
<%-- 							<input name="SRCH_RD_DT" type="radio" value="P" id="c1" class="i_radio" /> <label for="c1"><cbt:message code="txt.1280" text="Yesterday" /></label> --%>
<%-- 							<input name="SRCH_RD_DT" type="radio" value="T" id="c2" class="i_radio" /> <label for="c2"><cbt:message code="txt.729" text="Day" /></label> --%>
<%-- 							<input name="SRCH_RD_DT" type="radio" value="W" id="c3" class="i_radio" checked="checked" /> <label for="c3"><cbt:message code="txt.1222" text="Week" /></label> --%>
<%-- 							<input name="SRCH_RD_DT" type="radio" value="M" id="c4" class="i_radio" /> <label for="c4"><cbt:message code="txt.1406" text="Month" /></label> --%>
<!-- 						</div> -->
                    </td>
                        <th scope="row" title=""><cbt:message code="txt.1977" text="Condition Type" /></th>
                    <td>
				        <select>
				            <option>Application</option>
				            <option>APPROVED - NOT DISBURSED</option>
				            <option>DISBURSED</option>          
				        </select>  
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
	<section style="position:absolute; top:45px; right:0; left:0; bottom:0;">
		<!--Grid-->
	        <article class="gridArea">
	            <cb:grid style=" position:absolute; top:0px; bottom:30px; width:100%;" data-option="type:spread">
	                <table id="GRD_RPT" class="spread" data-spread="operationmode:3;scrollbars:virtual;pagesize:20;rownum:0;">
	                    <thead>
	                        <tr>	                            
	                            <cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" rowspan="2"><cbt:message code="txt.628" text="Div." /></cb:grid-column>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.2124" text="HO-HCM" /></cb:grid-column>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.1919" text="BINH DUONG" /></cb:grid-column>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.2066" text="DONG NAI" /></cb:grid-column>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.2188" text="LONG AN" /></cb:grid-column>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.2432" text="TIEN GIANG" /></cb:grid-column>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.2409" text="TAY NINH" /></cb:grid-column>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.2117" text="HA NOI" /></cb:grid-column>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.1912" text="BAC NINH" /></cb:grid-column>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.2009" text="DA NANG" /></cb:grid-column>
	                        	<cb:grid-column id=""     width="110px"    data-io="IO" data-column="align:center;" colspan="2"><cbt:message code="txt.1282" text="TOTAL" /></cb:grid-column>	                        		                        		                        	
	                        </tr>
	                        <tr>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1234" text="Amount" /></cb:grid-column>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1234" text="Amount" /></cb:grid-column>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1234" text="Amount" /></cb:grid-column>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1234" text="Amount" /></cb:grid-column>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1234" text="Amount" /></cb:grid-column>	                            
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1234" text="Amount" /></cb:grid-column>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1234" text="Amount" /></cb:grid-column>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1234" text="Amount" /></cb:grid-column>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1234" text="Amount" /></cb:grid-column>
	                            <cb:grid-column id=""	  width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
	                            <cb:grid-column id=""     width="40px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1234" text="Amount" /></cb:grid-column>                            
	                        </tr>
	                    </thead>
	                </table>
	            </cb:grid>
	        </article>
	    </section>
    <!--//GridArea-->
    
        <script type="text/javascript" charset="utf-8" src="/seize/crpt/CRPT3013.js"></script>
    
    </jsp:attribute>
</cb:pageWrapper>
