<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>﻿
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase"%>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr"%>
<cb:info>
<!-- 
 // ***********************************************************************************************
 // Program Name : [CKNW1030] Search Knowledge
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2017. 12. 25
 // Description  : Search Knowledge(지식검색)
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
<cb:pageWrapper title="Search Knowledge(지식검색)" id="CKNW1030" plugin="datepicker,grid,treeview" pageType="popup">
	
	<jsp:attribute name="headWrapper"></jsp:attribute>
	<jsp:attribute name="bodyWrapper">
    
	<!--SearchArea-->
	<span class="Srchline"></span>
	<div class="SrchDiv" id="DIV_SRCH">
		<table cellspacing="0" class="SrchTBL">
			<colgroup>
				<col  style="width:100px" />
				<col  style="width:" />
				<col  style="width:85px" />
				<col  style="width:232px" />
				<col  style="width:120px" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" title=""><cbt:message code="txt.1813" text="Keyword" /></th>
					<td><input data-name="txt.1813:Keyword" type="text" id="KEYWORD" data-io="I" maxlength="200" /></td>
					<th scope="row" title=""><cbt:message code="txt.758" text="Period" /></th>
					<td>
						<input name="CHK_DT" type="checkbox" value="" id="CHK_DT" class="i_check" style="width:12px;"/>
						<cb:datepicker id="SRCH_STR_DT" data-option="type:datepicker;dvalue:today-1m" data-valid="maxlength:8;" data-io="IO"/>
						<span>-</span>
						<cb:datepicker id="SRCH_END_DT" data-option="type:datepicker;dvalue:today" data-valid="maxlength:8;" data-io="IO"/>
					</td>
<%-- 					<th scope="row" title=""><cbt:message code="txt.1806" text="Importance" /></th> --%>
<%-- 					<td><cbt:combo code="IMPT_DO" codeType="all" id="CMB_KNW_LVL" style="width:100%;" data-io="IO" data-name="txt.2581:Knowledge code"/></td> --%>
					<td class="btn"><cb:button id="BTN_SRCH" value="" title="Query" class="btn_WF_srch"><cbt:message code="txt.1324" text="Query" /></cb:button></td>
				</tr>
				<tr id="" style="display:none;">
					<td colspan="5">
						<input type="hidden" id="CNSL_LRGCLAS_CD" data-io="IO" />
						<input type="hidden" id="CNSL_MEDCLAS_CD" data-io="IO" />
						<input type="hidden" id="CNSL_SMLCLAS_CD" data-io="IO" />
						<input type="hidden" id="KNW_LRGCLAS_CD" data-io="IO" />
						<input type="hidden" id="KNW_MIDCLAS_CD" data-io="IO" />
						<input type="hidden" id="KNW_SMLCLAS_CD" data-io="IO" />
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!--//SearchArea-->
    
    <section style="position:absolute; top:45px; right:0; left:0; bottom:0;">
		<article class="tab_group_list">
			<div id="TAB_ITEM" data-option="type:tabs">
				<ul>
					<li id=""><a href="#tab-no1"><cbt:message code="txt.1812" text="Knowledge Contents" /></a></li>
					<li id=""><a href="#tab-no2"><cbt:message code="txt.963" text="Consultation History" /></a></li>
				</ul>                                               
				<article class="tab_cont" style="position:absolute; top:24px; bottom:0; width:100%;">
					<!-- Knowledge Tab -->
					<div id="tab-no1" style="position:absolute; top:8px; right:8px; bottom:0; left:8px; ">    
						<!--treeArea-->
						<section style="position:absolute; top:0; left:0; bottom:50px; width:210px;">
							<h4>
								<cbt:message code="txt.1805" text="Knowledge Div." />
								<div>
									<cb:button id="BTN_KNW_EXP" value="" class="btn_WF_ico_plus m0_top" title="Expand"></cb:button>
									<cb:button id="BTN_KNW_CLS" value="" class="btn_WF_ico_minus m0_top" title="Collapse"></cb:button>
								</div>
							</h4>
							<div id="tree" class="boxst03" style="padding:0;margin-top:5px;">
								<div class="srch_title">
									<div class="fr mt5"></div>
								</div>
								<div id="TREE_KNW" style="height:100%; overflow:auto;" data-option="type:treeview">
									<div class="treeview" data-treeview="css:SPRITE;parent:HGRK_KNW_TYP_CD;code:KNW_TYP_CD;text:KNW_TYP_NM;load;"></div>
								</div>
							</div>
						</section>
						<!--//treeArea-->
						<!--GridArea-->
						<article class="gridArea" style="position: absolute; left: 218px; right: 0; bottom: 0; top: 0;">
							<cb:grid style=" position:absolute; top:0; right:0; bottom:30px; left:0;" data-option="type:spread">
								<table id="GRD_KNW" class="spread" data-spread="operationmode:2;scrollbars:virtual;pagesize:15;">
									<thead>
										<tr>
											<cb:grid-column id="KNW_SMRY"          width="*"   data-column="align:left;"><cbt:message code="txt.1812" text="Knowledge Contents" /></cb:grid-column>
											<!-- hidden -->
											<cb:grid-column id="TITE"              data-column="hidden;"></cb:grid-column>
											<cb:grid-column id="KNW_INF_SEQNO"     data-column="hidden;"></cb:grid-column>
											<cb:grid-column id="LVL_CD"            data-column="hidden;"></cb:grid-column>
											<cb:grid-column id="REG_ID"            data-column="hidden;"></cb:grid-column>
											<cb:grid-column id="RMK"               data-column="hidden;"></cb:grid-column>
											<cb:grid-column id="REG_DTM"           data-column="hidden;"></cb:grid-column>
											<cb:grid-column id="READ_TCNT"         data-column="hidden;"></cb:grid-column>
											<cb:grid-column id="REGR_NM"            data-column="hidden;"></cb:grid-column>
											<cb:grid-column id="FILE_YN"           data-column="hidden;"></cb:grid-column>
											<cb:grid-column id="KNW_CLAS_NM"       data-column="hidden;"></cb:grid-column>
										</tr>
									</thead>
								</table>
							</cb:grid>
						</article>
						<!--//GridArea-->
					</div>
					<!-- Knowledge Tab -->
					
					<!-- Consultation History Tab-->
					<div id="tab-no2" style="position:absolute; top:8px; right:8px; bottom:0; left:8px; ">
						<!--treeArea-->
						<section style="position:absolute; top:0; left:0; bottom:50px; width:210px;">
							<h4>
								<cbt:message code="txt.957" text="Consultation Type"  />
								<div>
									<cb:button id="BTN_CNT_EXP" value="" class="btn_WF_ico_plus m0_top" title="Expand"></cb:button>
									<cb:button id="BTN_CNT_CLS" value="" class="btn_WF_ico_minus m0_top" title="Collapse"></cb:button>
								</div>
							</h4>
							<div id="tree" class="boxst03" style="padding:0;margin-top:5px;">
								<div class="srch_title">
									<div class="fr mt5"></div>
								</div>
								<div id="TREE_CNT" style="height:100%; overflow:auto;" data-option="type:treeview">
									<div class="treeview" data-treeview="css:SPRITE;parent:HGRK_CNSL_CD;code:CNSL_CD;text:CNSL_NM;load;"></div>
								</div>
							</div>
						</section>
						<!--//treeArea-->
						<!--GridArea-->
						<article class="gridArea" style="position: absolute; left: 218px; right: 0; bottom: 0; top: 0;">
							<cb:grid style=" position:absolute; top:0; bottom:30px; width:100%;" data-option="type:spread">
								<table id="GRD_RMK" class="spread" data-spread="operationmode:2;scrollbars:virtual;pagesize:30;">
									<thead>
										<tr>
											<cb:grid-column id="MEMO"              width="*"   data-column="align:left;"><cbt:message code="txt.933" text="Consultation Contents" /></cb:grid-column>
											<!-- hidden -->
											<cb:grid-column id="MEMO_ID"           data-column="hidden;"></cb:grid-column>
											<cb:grid-column id="CNSL_SEQNO"        data-column="hidden;"></cb:grid-column>
											<cb:grid-column id="CNTR_CD"           data-column="hidden;"></cb:grid-column>
											<cb:grid-column id="GRP_CD"            data-column="hidden;"></cb:grid-column>
											<cb:grid-column id="TEAM_CD"           data-column="hidden;"></cb:grid-column>
											<cb:grid-column id="REG_ID"            data-column="hidden;"></cb:grid-column>
											<cb:grid-column id="REGR_NM"           data-column="hidden;"></cb:grid-column>
											<cb:grid-column id="LST_UPD_DTM"       data-column="hidden;"></cb:grid-column>
											<cb:grid-column id="CNSL_CLAS_NM"      data-column="hidden;"></cb:grid-column>
											<cb:grid-column id="CALL_CNSL_ID"      data-column="hidden;"></cb:grid-column>
											<cb:grid-column id="LKE_YN"            data-column="hidden;"></cb:grid-column>
										</tr>
									</thead>
								</table>
							</cb:grid>
						</article>
						<!--//GridArea-->
					</div>
				</article>
			</div>
		</article>
	</section>
	            
	<script id="rowTmplKnowledge" type="text/x-kendo-tmpl">
	<tr>
		<td class="rownum">
			<span>#: ROWNUM_ #</span>
		</td>
		<td>
			<div>	
				<span "knw-header>
					<a class="knw-title" data-seqno='#: KNW_INF_SEQNO #'>#: TITE #</a> <!--지식제목-->
				</span>
				<span class="knw-date">#: kendo.toString(kendo.parseDate(REG_DTM, "yyyyMMddHHmmss"), "G")  #</span> <!--작성일시-->
			</div>
				
			<div>
				<span class="knw-class">#: KNW_CLAS_NM #</span> <!--지식유형-->
			</div>
			<div class="knw-summary">#: KNW_SMRY #</div> <!--개요-->
			<div class="knw-status">
				<span class="lnb_writer" readonly="readonly"></span>
				<span>#: REGR_NM #</span> <!--작성자 명-->
				<span class="lnb_file" readonly="readonly"></span>
				<span>#: FILE_TCNT #</span>  <!--첨부파일 수-->
				<span class="lnb_read" readonly="readonly"></span>
				<span>#: READ_TCNT #</span>  <!--조회 건수-->
				<span class="lnb_comment" readonly="readonly"></span>
				<span>#: CMMT_TCNT #</span>  <!--댓글 건수-->
				<span class="lnb_like" #: LKE_YN == 'Y' ? '' : 'readonly=readonly' #></span>
				<span>#: LKE_TCNT #</span>   <!--좋아요 건수-->
			</div>
		</td>
	</tr>
	</script>
	
	<script id="rowTmplRemark" type="text/x-kendo-tmpl">
	<tr>
		<td class="rownum">
			<span>#: ROWNUM_ #</span>
		</td>
		<td>
			<div>	
				<span "knw-header>
					<a class="knw-title" data-callid='#: CALL_CNSL_ID #' >#: CNSL_SEQNO #</a> <!--상담번호-->
				</span>
				<span class="knw-date">#: kendo.toString(kendo.parseDate(LST_UPD_DTM, "yyyyMMddHHmmss"), "G")  #</span> <!--작성일시-->
			</div>

			<div>
				<span class="knw-class">#: fn_setDefStr(CNSL_CLAS_NM) #</span> <!--상담유형-->
			</div>
			<div class="knw-summary">#: MEMO #</div> <!--메모내용-->
			<div class="knw-status">
				<span class="lnb_writer" readonly="readonly"></span>
				<span>#: REGR_NM #</span>    <!--작성자명-->
			</div>
		</td>
	</tr>
	</script>
	
		<script type="text/javascript" src="/seize/cknw/CKNW1030.js"></script>
	</jsp:attribute>
</cb:pageWrapper>

