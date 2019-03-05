<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase"%>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr"%>
<cb:info>
	<!-- 
 // ***********************************************************************************************
 // Program Name : [CRPT3016] APPS
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2018. 03. 19
 // Description  : APPS
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
<cb:pageWrapper title="Apps" id="CRPT3016" plugin="datepicker,grid" pageType="">
	<jsp:attribute name="headWrapper"></jsp:attribute>
	<jsp:attribute name="bodyWrapper">
	
	<!--SearchArea-->
    <span class="Srchline"></span>
    <div class="SrchDiv" id="DIV_SRCH">
        <table cellspacing="0" class="SrchTBL">
            <colgroup>
                <col style="width:100px" />
                <col style="width:200px" />
                <col style="width:100px" />
                <col style="width:180px" />
                <col style="width:150px" />
                <col style="width:180px" />
                <col style="width:" />
            </colgroup>
            <tbody>	
            	 <tr>
                    <th scope="row" title=""><cbt:message code="txt.758" text="Period" /></th>
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
<!-- 						<div class="item inline"> -->
<%-- 							<input name="SRCH_RD_DT" type="radio" value="P" id="c1" class="i_radio" /> <label for="c1"><cbt:message code="txt.1280" text="Yesterday" /></label> --%>
<%-- 							<input name="SRCH_RD_DT" type="radio" value="T" id="c2" class="i_radio" /> <label for="c2"><cbt:message code="txt.729" text="Day" /></label> --%>
<%-- 							<input name="SRCH_RD_DT" type="radio" value="W" id="c3" class="i_radio" checked="checked" /> <label for="c3"><cbt:message code="txt.1222" text="Week" /></label> --%>
<%-- 							<input name="SRCH_RD_DT" type="radio" value="M" id="c4" class="i_radio" /> <label for="c4"><cbt:message code="txt.1406" text="Month" /></label> --%>
<!-- 						</div> -->
                    </td>
                    <th scope="row" title=""><cbt:message code="txt.1090" text="ID No." /></th>
                    <td><input id="CUST_NM" type="text" value="" data-name="txt.606:Name" maxlength="100" data-io="IO" style="width:100%;"/></td>
                    <th scope="row" title=""><cbt:message code="txt.607" text="Customer Name" /></th>
                    <td><input id="CUST_NM" type="text" value="" data-name="txt.606:Name" maxlength="100" data-io="IO" style="width:100%;"/></td>
                    <td class="btn">
                        <cb:button type="button" id="BTN_EXCEL" value="" class="btn_WF_excel" title="Excel" hidden="hidden"><cbt:message code="txt.1118" text="Excel" /></cb:button>
                        <cb:button type="button" id="BTN_PDF" value="" class="btn_WF_pdf" title="PDF"><cbt:message code="txt.1658" text="PDF" /></cb:button>
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
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2253" text="Pend Date" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2113" text="Full Name" /></cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1090" text="ID No." /></cb:grid-column>
                            	<cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1866" text="App. No" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1316" text="Product ID" /></cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1999" text="Cur Add" /></cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2176" text="Loan Amount" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2415" text="Tenure" /></cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2069" text="Eff Rate" /></cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2104" text="Flat Rate" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2067" text="Due Day" /></cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2072" text="EMI" /></cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2447" text="Total Interest" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2445" text="Total Insertest One Year" /></cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2439" text="Total Balance" /></cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1997" text="Credit Officer Code" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2100" text="Finnone User" /></cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1969" text="Company Name" /></cb:grid-column>
	                            <cb:grid-column id=""    width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2387" text="Source" /></cb:grid-column>
	                            <cb:grid-column id=""    width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2221" text="New Source" /></cb:grid-column>
	                            <cb:grid-column id=""    width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1360" text="Branch" /></cb:grid-column>
	                            <cb:grid-column id=""    width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2369" text="Sale Code" /></cb:grid-column>
	                            <cb:grid-column id=""    width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2155" text="kết quả" /></cb:grid-column>                                                       
	                            <cb:grid-column id=""    width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2194" text="lý do" /></cb:grid-column>
	                            <cb:grid-column id=""    width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2057" text="Disbursal Date" /></cb:grid-column>
	                            <cb:grid-column id=""    width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.590" text="Contract No." /></cb:grid-column>
	                            <cb:grid-column id=""    width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2056" text="Disbursal Amount" /></cb:grid-column>
	                            <cb:grid-column id=""    width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2029" text="DC Code" /></cb:grid-column>	                            
	                        </tr>
	                    </thead>
	                </table>
	            </cb:grid>
	        </article>
	    </section>
    <!--//GridArea-->
    
        <script type="text/javascript" charset="utf-8" src="/seize/crpt/CRPT3016.js"></script>
        
    </jsp:attribute>
</cb:pageWrapper>
