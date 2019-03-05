<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase" %>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr" %>
<cb:info>
<!-- 
 // ***********************************************************************************************
 // Program Name : [CCUS1020] Management Customer Status
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2017. 10. 18
 // Description  : Management Customer Status screen(고객 관리상태 조회 화면)
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
<cb:pageWrapper title="Management Customer Status Search" id="CCUS1020" plugin="datepicker,grid,multicombo" pageType="">

	<jsp:attribute name="headWrapper"></jsp:attribute>
	<jsp:attribute name="bodyWrapper">
    
	<!--SearchArea-->
	<span class="Srchline"></span>
	<div class="SrchDiv" id="DIV_SRCH">
		<table cellspacing="0" class="SrchTBL">
			<colgroup>
				<col style="width:100px" />
				<col style="width:230px" />
				<col style="width:90px" />
				<col style="width:18%" />
				<col style="width:100px" />
				<col style="width:18%" />
				<col style="width:130px" />
			</colgroup>
			<tbody>	
				<tr>
					<th scope="row" title=""><cbt:message code="txt.678" text="Date" /></th>
					<td>
						<cb:datepicker id="SRCH_STR_DT" data-option="type:datepicker;dvalue:today-7d" data-name="txt.1081:Starting Date" data-valid="maxlength:8;require;" data-io="IO" class="point" />
                        <span>-</span>
                        <cb:datepicker id="SRCH_END_DT" data-option="type:datepicker;dvalue:today" data-name="txt.1331:End Date" data-valid="maxlength:8;require;" data-io="IO" class="point" />
					</td>
					<th scope="row" title=""><cbt:message code="txt.606" text="Name" /></th>
					<td><input id="CUST_NM" name="text" type="text" value="" data-io="IO" data-option="type:text" style="width:100%;" maxlength="100"/></td>
					<th scope="row" title=""><cbt:message code="txt.1302" text="Contact No" /></th>
					<td><input id="CNNT_TEL_NO" name="text" type="text" value="" data-io="IO" data-option="type:phone;" style="width:100%;" maxlength="40"/></td>
<%-- 					<th scope="row" title=""><cbt:message code="txt.636" text="Mgt. Status" /></th> --%>
<%-- 					<td><cbt:combo code="MGNT_ST" codeType="multi" id="MGR_STS_CD" data-name="txt.636:Mgt. Status" data-io="IO" style="width:100%;" /></td> --%>
<!-- 					<td></td> -->
				</tr>
				<tr>
					<th scope="row" title=""><cbt:message code="txt.972" text="Organization" /></th>
					<td colspan="5">
						<cbt:combo code="" name="CMB_CNTR" id="CMB_CNTR_CD" data-option="event:init;type:dept-cntr;top:ALL"                             data-io="IO" style="width:22%;" />
						<cbt:combo code="" name="CMB_CNTR" id="CMB_GRP_CD"  data-option="event:init;type:dept-grp;top:ALL"  data-parent="#CMB_CNTR_CD"  data-io="IO" style="width:22%;" />
						<cbt:combo code="" name="CMB_CNTR" id="CMB_TEAM_CD" data-option="event:init;type:dept-team;top:ALL" data-parent="#CMB_GRP_CD"   data-io="IO" style="width:22.4%;" />
						<cbt:combo code="" name="CMB_CNTR" id="CMB_USR_ID"  data-option="event:init;type:dept-user;top:ALL" data-parent="#CMB_TEAM_CD"  data-io="IO" style="width:32.5%;" />
					</td>
					<td class="btn" >
						<cb:button id="BTN_EXCEL" value="" title="Excel" class="btn_WF_excel" hidden="hidden"><cbt:message code="txt.1118" text="Excel" /></cb:button>
						<cb:button id="BTN_SRCH"  value="" title="Query" class="btn_WF_srch"><cbt:message code="txt.1324" text="Query" /></cb:button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!--//SearchArea-->
    
	<!--GridArea-->
	<section style="position:absolute; top:71px; right: 0; bottom:185px; left:0;">
		<!--Grid-->
		<article class="gridArea">
			<cb:grid style=" position:absolute; top:0; width:100%; bottom:30px;" data-option="type:spread">
				<table id="GRD_LIST" class="spread" data-spread="operationmode:3;scrollbars:virtual;pagesize:20;">
					<thead>
						<tr>
							<cb:grid-column id="CUST_NO"         width="120px"   data-column="align:center;"><cbt:message code="txt.599" text="Customer ID" /></cb:grid-column>
							<cb:grid-column id="CUST_NM"         width="*"       data-column="align:left;"><cbt:message code="txt.606" text="Name" /></cb:grid-column>
							<cb:grid-column id="CUST_INFW_NM"    width="180px"   data-column="align:center;"><cbt:message code="txt.2007" text="Customer inflow division" /></cb:grid-column>
<%-- 							<cb:grid-column id="MNG_STS_NM"      width="140px"   data-column="align:center;"><cbt:message code="txt.636" text="Mgt. Status" /></cb:grid-column> --%>
							<cb:grid-column id="CUR_STR_DTM"     width="170px"   data-column="align:center;type:datetime;"><cbt:message code="txt.1419" text="Last Contact Date" /></cb:grid-column>
							<cb:grid-column id="CNSLR_NM"        width="300px"   data-column="align:left;"><cbt:message code="txt.1414" text="Last Contact Agent" /></cb:grid-column>
						</tr>
					</thead>
				</table>
			</cb:grid>
		</article>
	</section>
	<!--//GridArea-->
    
	<!--DetailArea-->
	<section style="position:absolute; right: 0; bottom:0px; left:0; height:200px;">
		<section style="position:absolute; top:0px; right: 0; left:0;">
			<h4><cbt:message code="txt.638" text="Registration history of management status" /></h4>
		</section>
		<!--Grid-->
		<article class="gridArea">
			<div style=" position:absolute; top:20px; height:180px; width:100%;" data-option="type:spread">
				<table id="GRD_DETAIL_LIST" class="spread" data-spread="operationmode:3">
					<thead>
						<tr>
							<th id="REG_DTM"    width="170px"   data-column="align:center;type:datetime;"><cbt:message code="txt.678" text="Date" /></th>
							<th id="USR_NM"     width="240px"   data-column="align:left;"><cbt:message code="txt.724" text="Agent" /></th>
<%-- 							<th id="MNG_STS_NM" width="140px"   data-column="align:center;"><cbt:message code="txt.636" text="Mgt. Status" /></th> --%>
							<th id="REG_CTT"    width="*"       data-column="align:left;"><cbt:message code="txt.904" text="Remark" /></th>
						</tr>
					</thead>
				</table>
			</div>
		</article>
	</section>
	<!--//DetailArea-->    		
    		
		<script type="text/javascript" src="/seize/ccus/CCUS1020.js"></script>		
    </jsp:attribute>
</cb:pageWrapper>

