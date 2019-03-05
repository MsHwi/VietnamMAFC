<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase"%>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr"%>
<cb:info>
<!-- 
 // ***********************************************************************************************
 // Program Name : [CRPT3022] Report Detail 
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2018. 03. 19
 // Description  : REPORT DETAIL
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
<cb:pageWrapper title="Report Detail" id="CRPT3022" plugin="datepicker,grid" pageType="">
    <jsp:attribute name="headWrapper"></jsp:attribute>
    <jsp:attribute name="bodyWrapper">
    
    <!--SearchArea-->
    <span class="Srchline"></span>
    <div class="SrchDiv" id="DIV_SRCH">
        <table cellspacing="0" class="SrchTBL">
            <colgroup>
                <col style="width:100px" />
                <col style="width:60%" />
                <col style="width:" />
            </colgroup>
            <tbody>
                 <tr>
                    <th scope="row" title=""><cbt:message code="txt.758" text="Period" /></th>
                    <td>
                        <cb:datepicker id="SRCH_STR_DT" data-option="type:datepicker;dvalue:today-7d" data-valid="maxlength:8;" data-io="IO" class="point" />
                        <span>-</span>
                        <cb:datepicker id="SRCH_END_DT" data-option="type:datepicker;dvalue:today" data-valid="maxlength:8;" data-io="IO" class="point" />
                        <div class="item inline">
                             <input name="SRCH_RD_DT" type="radio" value="P" id="c1" class="i_radio" /> <label for="c1"><cbt:message code="txt.1280" text="Yesterday" /></label>
                             <input name="SRCH_RD_DT" type="radio" value="T" id="c2" class="i_radio" /> <label for="c2"><cbt:message code="txt.729" text="Day" /></label>
                             <input name="SRCH_RD_DT" type="radio" value="W" id="c3" class="i_radio" checked="checked"/> <label for="c3"><cbt:message code="txt.1222" text="Week" /></label>
                             <input name="SRCH_RD_DT" type="radio" value="M" id="c4" class="i_radio" /> <label for="c4"><cbt:message code="txt.1406" text="Month" /></label>
                        </div>
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
    
    <!-- Grid Area -->
    <section style="position:absolute; top:45px; right:0; left:0; bottom:0;">
        <!--Grid-->
            <article class="gridArea">
                <cb:grid style=" position:absolute; top:0px; bottom:30px; width:100%;" data-option="type:spread">
                    <table id="GRD_RPT" class="spread" data-spread="operationmode:3;scrollbars:virtual;pagesize:20;">
                        <thead>
                            <tr>
                                <cb:grid-column id="AGREE_ID"     width="80px"     data-io="IO" data-column="align:center;"><cbt:message code="txt.1849" text="Agree ID" /></cb:grid-column>
                                <cb:grid-column id="CUST_NM"      width="120px"    data-io="IO" data-column="align:left;"><cbt:message code="txt.608" text="Cust Name" /></cb:grid-column>
                                <cb:grid-column id="APP_DAY"      width="100px"    data-io="IO" data-column="align:center;type:date;"><cbt:message code="txt.1865" text="App Day" /></cb:grid-column>
                                <cb:grid-column id="TYPE"         width="100px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1140" text="Type" /></cb:grid-column>
                                <%-- <cb:grid-column id="STATUS"       width="100px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1040" text="Status" /></cb:grid-column> --%>
                                <cb:grid-column id="LOAN_TYPE"    width="100px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2185" text="Loan type" /></cb:grid-column>
                                <cb:grid-column id="AMTFIN"       width="100px"    data-io="IO" data-column="align:right;type:number;"><cbt:message code="txt.2176" text="Loan amount" /></cb:grid-column>
                                <cb:grid-column id="LASTED_ACT"   width="100px"    data-io="IO" data-column="align:center;type:date;"><cbt:message code="txt.2163" text="Lasted Activity" /></cb:grid-column>
                            </tr>
                        </thead>
                    </table>
                </cb:grid>
            </article>
        </section>
    <!--//GridArea-->
    
    <script type="text/javascript" charset="utf-8" src="/seize/crpt/CRPT3022.js"></script>
    
    </jsp:attribute>
</cb:pageWrapper>
