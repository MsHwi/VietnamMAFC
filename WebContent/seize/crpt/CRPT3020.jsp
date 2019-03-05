<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase"%>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr"%>
<cb:info>
	<!-- 
 // ***********************************************************************************************
 // Program Name : [CRPT3020] COORDINATOR'S PERFORMANCE 
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2018. 03. 19
 // Description  : COORDINATOR'S PERFORMANCE
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
<cb:pageWrapper title="Coordinator's Performance" id="CRPT3020" plugin="datepicker,grid" pageType="">
	<jsp:attribute name="headWrapper"></jsp:attribute>
	<jsp:attribute name="bodyWrapper">
	
	<!--SearchArea-->
    <span class="Srchline"></span>
    <div class="SrchDiv" id="DIV_SRCH">
        <table cellspacing="0" class="SrchTBL">
            <colgroup>
                <col style="width:100px" />
                <col style="width:250px" />
                <col style="width:100px" />
                <col style="width:" />
                <col style="width:7px" />
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
                    </td>
                    <th scope="row" title=""><cbt:message code="txt.972" text="Organization" /></th>
                    <td>
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_CNTR_CD" data-option="event:init;type:dept-cntr;top:ALL"                             data-io="IO" style="width:25%;" />
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_GRP_CD"  data-option="event:init;type:dept-grp;top:ALL"  data-parent="#CMB_CNTR_CD"  data-io="IO" style="width:25%;" />
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_TEAM_CD" data-option="event:init;type:dept-team;top:ALL" data-parent="#CMB_GRP_CD"   data-io="IO" style="width:24%;" />
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_USR_ID"  data-option="event:init;type:dept-user;top:ALL" data-parent="#CMB_TEAM_CD"  data-io="IO" style="width:24.5%;" />
                    </td>
                 </tr>
                 <tr>
                    <td class="btn" colspan="5">
                        <cb:button type="button" id="BTN_EXCEL" value="" class="btn_WF_excel" title="Excel" hidden="hidden"><cbt:message code="txt.1118" text="Excel" /></cb:button>
                        <cb:button type="button" id="BTN_PDF" value="" class="btn_WF_pdf" title="PDF"  hidden="hidden"><cbt:message code="txt.1658" text="PDF" /></cb:button>
                        <cb:button type="button" id="BTN_SRCH" value="" title="Query" class="btn_WF_srch"><cbt:message code="txt.1324" text="Query" /></cb:button>
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
	                <table id="GRD_RPT" class="spread" data-spread="operationmode:3;scrollbars:virtual;pagesize:20;">
	                    <thead>
	                        <tr>
	                            <cb:grid-column id=""     width="70px"    data-io="IO" data-column="align:center;" rowspan="2"><cbt:message code="txt.1021" text="Center" /></cb:grid-column>
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" rowspan="2"><cbt:message code="txt.656" text="Group" /></cb:grid-column>
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" rowspan="2"><cbt:message code="txt.1502" text="Team" /></cb:grid-column>
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" rowspan="2"><cbt:message code="txt.938" text="Agent ID" /></cb:grid-column>
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" rowspan="2"><cbt:message code="txt.724" text="Agent" /></cb:grid-column>	                            
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" rowspan="2"><cbt:message code="txt.628" text="Div." /></cb:grid-column>
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" colspan="3"><cbt:message code="txt.2119" text="HCM" /></cb:grid-column>
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" colspan="3"><cbt:message code="txt.1919" text="BINH DUONG" /></cb:grid-column>
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" colspan="3"><cbt:message code="txt.2066" text="DONG NAI" /></cb:grid-column>
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" colspan="3"><cbt:message code="txt.2188" text="LONG AN" /></cb:grid-column>
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" colspan="3"><cbt:message code="txt.2432" text="TIEN GIANG" /></cb:grid-column>
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" colspan="3"><cbt:message code="txt.1282" text="TOTAL" /></cb:grid-column>
	                            <cb:grid-column id=""     width="100px"    data-io="IO" data-column="align:center;" rowspan="2"><cbt:message code="txt.1964" text="Commission" /></cb:grid-column>
	                        </tr>
	                        <tr>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.852" text="Assign" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1962" text="Collet." /></cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2054" text="Disb." /></cb:grid-column>
                            	<cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.852" text="Assign" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1962" text="Collet." /></cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2054" text="Disb." /></cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.852" text="Assign" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1962" text="Collet." /></cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2054" text="Disb." /></cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.852" text="Assign" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1962" text="Collet." /></cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2054" text="Disb." /></cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.852" text="Assign" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1962" text="Collet." /></cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2054" text="Disb." /></cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.852" text="Assign" /></cb:grid-column>
	                            <cb:grid-column id=""     width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.1962" text="Collet." /></cb:grid-column>
	                            <cb:grid-column id=""	  width="50px"    data-io="IO" data-column="align:center;"><cbt:message code="txt.2054" text="Disb." /></cb:grid-column>                                                       
	                        </tr>
	                    </thead>
	                </table>
	            </cb:grid>
	        </article>
	    </section>
    <!--//GridArea-->
    
        <script type="text/javascript" charset="utf-8" src="/seize/crpt/CRPT3020.js"></script>
        
    </jsp:attribute>
</cb:pageWrapper>
