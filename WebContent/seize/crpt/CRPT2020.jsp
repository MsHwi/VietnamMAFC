<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase" %>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr" %>
<cb:info>
<!-- 
 // ***********************************************************************************************
 // Program Name : [CRPT2020] Complaint Management Report
 // Creator      : jekalhg@buttle.co.kr
 // Create Date  : 2018. 03. 14
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
<cb:pageWrapper title="Complaint Management Report" id="CRPT2020" plugin="datepicker,grid,multicombo" pageType="">

	<jsp:attribute name="headWrapper"></jsp:attribute>
	<jsp:attribute name="bodyWrapper">
    
	<!--SearchArea-->
	<span class="Srchline"></span>
	<div class="SrchDiv" id="DIV_SRCH">
		<table cellspacing="0" class="SrchTBL">
			<colgroup>
                <col style="width:100px" />
                <col style="width:50%" />
                <col style="width:100px" />
                <col style="width:30%" />
                <col style="width:205px" />
	        </colgroup>
	        
			<tbody>	
				<tr>
					<th scope="row" title="" class="issue"><cbt:message code="txt.1326" text="Query Period" /></th>
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
                        <div class="item inline">
                            <input name="SRCH_RD_DT" type="radio" value="P" id="c1" class="i_radio" /> <label for="c1"><cbt:message code="txt.1280" text="Yesterday" /></label>
                            <input name="SRCH_RD_DT" type="radio" value="T" id="c2" class="i_radio" /> <label for="c2"><cbt:message code="txt.729" text="Day" /></label>
                            <input name="SRCH_RD_DT" type="radio" value="W" id="c3" class="i_radio" checked="checked" /> <label for="c3"><cbt:message code="txt.1222" text="Week" /></label>
                            <input name="SRCH_RD_DT" type="radio" value="M" id="c4" class="i_radio" /> <label for="c4"><cbt:message code="txt.1406" text="Month" /></label>
                        </div>                       
					</td>
					<th><cbt:message code="txt.2045" text="Dept." /></th>
					<td>
					<cbt:combo code="selectList:CRPT2020.SELECT_DEPT" 
                                             id="CMB_DEPT_CD" 
                                       codeType="multi" 
                                    data-option="event:init;top:ALL" 
                                          style="width: 100%;" 
                                        data-io="IO" /></td>					
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
    <section style="position:absolute; top:45px; right:0; left:0; height:165px;">
        <h4><cbt:message code="txt.1972" text="Complaint by Department" /></h4>
        <!--Grid-->
        <article class="gridArea">
            <cb:grid style=" position:absolute; top:18px; bottom:30px; width:100%;" data-option="type:spread">
                <table id="GRD_RPT" class="spread" data-spread="operationmode:3;scrollbars:virtual;pagesize:4;">
                    <thead>
                        <tr>
                            <cb:grid-column id="DEPT"       width="415px"    data-io="IO" data-column="align:left;"><cbt:message code="txt.900" text="Department" /></cb:grid-column>
                            <cb:grid-column id="TOT_CASE"   width="200px"    data-io="IO" data-column="align:right;type:number;"><cbt:message code="txt.2440" text="Total cases" /></cb:grid-column>
                            <cb:grid-column id="INIT_CASE"  width="200px"    data-io="IO" data-column="align:right;type:number;"><cbt:message code="txt.2138" text="Initiate cases" /></cb:grid-column>
                            <cb:grid-column id="PRGR_CASE"  width="200px"    data-io="IO" data-column="align:right;type:number;"><cbt:message code="txt.2325" text="Progressing case" /></cb:grid-column>
                            <cb:grid-column id="CLSD_CASE"  width="200px"    data-io="IO" data-column="align:right;type:number;"><cbt:message code="txt.1957" text="Closed case" /></cb:grid-column>
                            
                            <!-- hidden column -->
                            <cb:grid-column id="DEPT_CD"    width=""    data-io="IO" data-column="hidden" ></cb:grid-column>
                        </tr>
                    </thead>
                </table>
            </cb:grid>
        </article>
    </section>
    <!--//GridArea-->
    
<!--     ButtonArea -->
<!--     <section style="position:absolute; top:185px; right:0; left:0;"> -->
<!--         <div class="botmBtn_rig"> -->
<%--             <cb:button type="button" id="BTN_SELECT" title="Select" class="btn_WF_act"><cbt:message code="txt.996" text="Select" /></cb:button> --%>
<!--         </div> -->
<!--     </section> -->
<!--     //ButtonArea -->
    
    <!--GridArea-->
    <section style="position:absolute; top:195px; right:0; bottom:0; left:0;">
        <h4><cbt:message code="txt.977" text="Details" /></h4>
        <!--Grid-->
        <article class="gridArea">
            <cb:grid style=" position:absolute; top:20px; bottom:30px; width:100%;" data-option="type:spread">
                <table id="GRD_RPT_DETL" class="spread" data-spread="operationmode:3;scrollbars:virtual;pagesize:20;">
                    <thead>
                        <tr>
                            <cb:grid-column id="CUST_NM"     width="200px"    data-io="IO" data-column="align:left;"><cbt:message code="txt.608" text="Cust Name" /></cb:grid-column>
                            <cb:grid-column id="AGR_IDCMND"  width="150px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.598" text="Cust ID" /></cb:grid-column>
                            <cb:grid-column id="DEPT_NM"     width="150px"    data-io="IO" data-column="align:left;"><cbt:message code="txt.900" text="Department" /></cb:grid-column>
                            <cb:grid-column id="LAST_CUR_RMK"  width="340px"    data-io="IO" data-column="align:left;"><cbt:message code="txt.1984" text="Consultation Remark" /></cb:grid-column>
                            <cb:grid-column id="CNTNT"       width="340px"    data-io="IO" data-column="align:left;"><cbt:message code="txt.2634" text="Processing Remark" /></cb:grid-column>
                            <cb:grid-column id="PRIO"        width="100px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2315" text="Priority" /></cb:grid-column>
                            <cb:grid-column id="STAT"        width="100px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1386" text="Status" /></cb:grid-column>
                            <cb:grid-column id="CRTD"        width="200px"    data-io="IO" data-column="align:center;type:datetime;"><cbt:message code="txt.1995" text="Created" /></cb:grid-column>
                            <cb:grid-column id="CRTD_BY"     width="200px"    data-io="IO" data-column="align:left;"><cbt:message code="txt.1996" text="Created by" /></cb:grid-column>
                        </tr>
                    </thead>
                </table>
            </cb:grid>
        </article>
    </section>
    <!--//GridArea-->
    
    <script type="text/javascript" charset="utf-8" src="/seize/crpt/CRPT2020.js"></script>
    
    </jsp:attribute>
</cb:pageWrapper>
