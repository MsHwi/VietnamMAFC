<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase" %>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr" %>
<cb:info>
<!-- 
 // ***********************************************************************************************
 // Program Name : [CRPT3018] Approved-Disbursed
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2018. 03. 14
 // Description  : Approved-Disbursed
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
<cb:pageWrapper title="Approved-Disbursed" id="CRPT3018" plugin="datepicker,grid" pageType="">

    <jsp:attribute name="headWrapper"></jsp:attribute>
    <jsp:attribute name="bodyWrapper">
    
    <!--SearchArea-->
    <span class="Srchline"></span>
    <div class="SrchDiv" id="DIV_SRCH">
        <table cellspacing="0" class="SrchTBL">
            <colgroup>
                <col style="width:100px" />
                <col style="width:500px" />
                <col style="width:100px" />
                <col style="width:200px" />
                <col style="width:100px" />
                <col style="width:200px" />
                <col style="width:8px" />
            </colgroup>
            
            <tbody> 
                <tr>
                    <th scope="row" title=""><cbt:message code="txt.678" text="Date" /></th>
                    <td>
                        <cb:datepicker id="SRCH_STR_DT" data-option="type:datepicker;dvalue:today-30d" data-valid="maxlength:8;" data-io="IO" class="point" />
                        <span>-</span>
                        <cb:datepicker id="SRCH_END_DT" data-option="type:datepicker;dvalue:today" data-valid="maxlength:8;" data-io="IO" class="point" />
                       <div class="item inline">
                           <input name="SRCH_RD_DT" type="radio" value="P" id="c1" class="i_radio" /> <label for="c1"><cbt:message code="txt.1280" text="Yesterday" /></label>
                           <input name="SRCH_RD_DT" type="radio" value="T" id="c2" class="i_radio" /> <label for="c2"><cbt:message code="txt.729" text="Day" /></label>
                           <input name="SRCH_RD_DT" type="radio" value="W" id="c3" class="i_radio" /> <label for="c3"><cbt:message code="txt.1222" text="Week" /></label>
                           <input name="SRCH_RD_DT" type="radio" value="M" id="c4" class="i_radio" checked="checked" /> <label for="c4"><cbt:message code="txt.1406" text="Month" /></label>
                       </div>
                    </td>
                    <th scope="row" title=""><cbt:message code="txt.2005" text="Cust. Name" /></th>
                    <td><input id="CUST_NM" type="text" value="" data-name="txt.2005:Cust. Name" maxlength="100" data-io="IO" style="width:100%;"/></td>
                    <th scope="row" title=""><cbt:message code="txt.2004" text="Cust. ID No." /></th>
                    <td><input id="REALNM_NO" type="text" value="" data-name="txt.2004:Cust. ID No." maxlength="100" data-io="IO" style="width:100%;"/></td>                    
                </tr>
                <tr> 
                    <td class="btn" colspan="7">
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
                <table id="GRD_RPT" class="spread" data-spread="operationmode:3;scrollbars:virtual;pagesize:30;">
                    <thead>
                        <tr>
                            <cb:grid-column id="AGREEMENTID"        width="110px"   data-column="align:center;"><cbt:message code="txt.1851" text="Agreement ID" /></cb:grid-column>
                            <cb:grid-column id="PRODUCTFLAG"        width="100px"   data-column="align:center;"><cbt:message code="txt.2323" text="Product Flag" /></cb:grid-column>
                            <cb:grid-column id="DISBURSALDATE"      width="120px"   data-column="align:center;type:date;"><cbt:message code="txt.2057" text="Disbursal Date" /></cb:grid-column>
                            <cb:grid-column id="CUST_NAME"          width="160px"   data-column="align:left;"><cbt:message code="txt.2005" text="Cust. Name" /></cb:grid-column>
                            <cb:grid-column id="CIF_NO"             width="100px"   data-column="align:center;"><cbt:message code="txt.2004" text="Cust. ID No." /></cb:grid-column>
                            <cb:grid-column id="CONTRACT_NO"        width="180px"   data-column="align:center;"><cbt:message code="txt.590"  text="Contract No." /></cb:grid-column>
                            <cb:grid-column id="PRODUCT_NAME"       width="120px"   data-column="align:center;"><cbt:message code="txt.2218" text="Name of Product" /></cb:grid-column>
                            <cb:grid-column id="DISBURSAL_AMOUNT"   width="130px"   data-column="align:right;type:number;"><cbt:message code="txt.2056" text="Disbursal Amount" /></cb:grid-column>
                            <cb:grid-column id="TENURE"             width="100px"   data-column="align:right;type:number;"><cbt:message code="txt.2415" text="Tenure" /></cb:grid-column>
                            <cb:grid-column id="EFFRATE"            width="100px"   data-column="align:right;type:number;"><cbt:message code="txt.2070" text="Effective Rate" /></cb:grid-column>
                            <cb:grid-column id="FLAT_RATE"          width="100px"   data-column="align:center;type:number;"><cbt:message code="txt.2104" text="Flat Rate" /></cb:grid-column>
                            <%-- <cb:grid-column id="SCORING"            width="100px"   data-column="align:center;"><cbt:message code="txt.2375" text="Scoring" /></cb:grid-column> --%>
                            <cb:grid-column id="DUEDAY"             width="100px"   data-column="align:right;type:number;"><cbt:message code="txt.2067" text="Due Day" /></cb:grid-column>
                            <cb:grid-column id="EMI"                width="100px"   data-column="align:right;type:number;"><cbt:message code="txt.2072" text="EMI" /></cb:grid-column>
                            <cb:grid-column id="TOT_INTEREST"       width="100px"   data-column="align:right;type:number;"><cbt:message code="txt.2447" text="Total Interest" /></cb:grid-column>
                            <cb:grid-column id="TOT_INTEREST_YEAR"  width="180px"   data-column="align:right;type:number;"><cbt:message code="txt.2446" text="Total Insertest(One Year)" /></cb:grid-column>
                            <cb:grid-column id="TOT_BALANCE"        width="100px"   data-column="align:right;type:number"><cbt:message code="txt.2439" text="Total Balance" /></cb:grid-column>
                            <cb:grid-column id="CRDT_OFCR_CODE"     width="130px"   data-column="align:center;"><cbt:message code="txt.1997" text="Credit Officer Code" /></cb:grid-column>
                            <cb:grid-column id="FINN_USER"          width="100px"   data-column="align:center;"><cbt:message code="txt.2100" text="Finnone User" /></cb:grid-column>
                            <cb:grid-column id="COMPANY_NAME"       width="360px"   data-column="align:left;"><cbt:message code="txt.1969" text="Company Name" /></cb:grid-column>
                            <cb:grid-column id="SOURCE"             width="90px"    data-column="align:center;"><cbt:message code="txt.2387" text="Source" /></cb:grid-column>
                            <cb:grid-column id="DC_CODE"            width="100px"   data-column="align:center;"><cbt:message code="txt.2029" text="DC Code" /></cb:grid-column>
                            <cb:grid-column id="NEW_SOURCE"         width="180px"   data-column="align:left;"><cbt:message code="txt.2221" text="New Source" /></cb:grid-column>
                            <cb:grid-column id="BRANCH"             width="100px"   data-column="align:center;"><cbt:message code="txt.1360" text="Branch" /></cb:grid-column>
                            <cb:grid-column id="SALE_CODE"          width="100px"   data-column="align:center;"><cbt:message code="txt.2369" text="Sale Code" /></cb:grid-column>
                        </tr>
                    </thead>
                </table>
            </cb:grid>
        </article>
    </section>
    
    <script type="text/javascript" charset="utf-8" src="/seize/crpt/CRPT3018.js"></script>
    
    </jsp:attribute>
</cb:pageWrapper>
