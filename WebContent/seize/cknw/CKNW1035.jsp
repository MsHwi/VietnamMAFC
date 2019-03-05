<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>﻿
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase"%>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr"%>
<cb:info>
<!-- 
 // ***********************************************************************************************
 // Program Name : [CKNW1035] Knowledge View
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2017. 12. 26
 // Description  : Knowledge View(지식정보 화면)
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
<cb:pageWrapper title="Knowledge View(지식정보)" id="CKNW1035" plugin="grid" pageType="popup">

	<jsp:attribute name="headWrapper"></jsp:attribute>
	<jsp:attribute name="bodyWrapper">

	<!--TitleArea-->
	<span class="Srchline"></span>
	<div class="SrchDiv" style="position:absolute;">
		<table cellspacing="0" class="SrchTBL" id="TB_KNW">
			<colgroup>
				<col  style="width:90px" />
				<col  style="width:" />
				<col  style="width:8px" />
			</colgroup>
			<tbody> 
				<tr>
					<th scope="row" title=""><cbt:message code="txt.1313" text="Subject" /></th>
					<td><input id="TITE" name="text" type="text" value="" readonly="readonly" data-io="IO" /></td>
				</tr>
				<tr>
					<th></th>
					<td>
						<div class="knw-status">
							<span class="lnb_writer" readonly="readonly" ></span>
							<span id="REGR_NM" data-io="IO"></span> <!--작성자 명-->
							<span class="lnb_read" readonly="readonly" ></span>
							<span id="PUSL_TCNT" data-io="IO"></span>  <!--조회 건수-->
							<span class="lnb_file" readonly="readonly" ></span>
							<span id="FILE_TCNT" data-io="IO"></span>  <!--첨부파일 수-->
							<span id="LKE_STAT" class="lnb_like" readonly="readonly" style="cursor:pointer;" title="Like"></span>
							<span id="LKE_TCNT" data-io="IO"></span>   <!--좋아요 건수-->
							<span id="BTN_DEL_KNW" class="lnb_del" readonly="readonly" style="cursor:pointer;" title="Delete"></span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!--//TitleArea-->
	
	<!--ContentsArea-->
	<div style="position:absolute; top:70px; bottom:199px; width:100%; border: 1px solid #c5c5c5; border-radius: 0;">    
		<!--editor-->
		<div class="boxst02 tran" style="position:absolute; top:0; bottom:0; left:0; right:0; overflow-y:auto; padding: 5px;">
			<span id="KNW_CONT"></span>
		</div>
		<!--//editor-->
	</div>  
	<!--//ContentsArea-->
	
	<!--FileArea-->    
	<div class="Area_file area_auto" style="position:absolute; bottom:150px; overflow-y:auto; height:50px; border-top-left-radius: 0px; border-top-right-radius: 0px;" >
		<table>
			<colgroup>
				<col style="width:90px" /> 
				<col style="width:;" /> 
			</colgroup>
			<tbody>
				<tr>
					<th><cbt:message code="txt.1393" text="Attachment" /></th>
					<td>
						<div>
							<table class="boxst_file">
								<colgroup>
									<col style="width:;" />
									<col style="width:22px" />
								</colgroup>
								<tbody id="FILE_VIEW" data-io="IO"></tbody>
							</table>
						</div>
					</td>    
				</tr>
			</tbody>
		</table>
	</div>
	<!--//FileArea-->

	<!--CommentListArea-->
	<section style="position:absolute; right:0; left:0; bottom:54px;">
		<div id="LST_CMT" class="boxst03" style="height:90px; width:100%; overflow: auto;" >
		</div>
	</section>
	<!--//CommentListArea-->
	
	<!--CommentArea-->
	<section style="position:absolute; right: 0; left: 0; bottom: 14px; height:42px; " >
		<div class="boxst05"> 
			<table>
				<colgroup>
					<col style="width:90px;" /> 
					<col style="width:;" />
					<col style="width:50px;" /> 
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" title=""><cbt:message code="txt.1816" text="Comments" /></th>
						<td>
							<textarea id="CMMT" data-io="IO" data-name="txt.904:Remark" cols="1" rows="2" style="width:100%; height:40px;" maxlength="500"></textarea>
						</td>
						<td>
							<div class="botmBtn_rig">
								<cb:button id="BTN_ADD_CMT" value="" title="Write" class="btn_WF" style="height:40px;"><cbt:message code="txt.1104" text="Write" /></cb:button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</section>
	<!--//CommentArea-->

	<script id="rowTmplComment" type="text/x-kendo-tmpl">
	<div class="cmt-contents">
		<span class="writer">#: REGR_NM #</span>    <!--작성자명-->
			#: " " + CMMT + " " # 
		<span class="date">#: kendo.toString(kendo.parseDate(LST_UPD_DTM, "yyyyMMddHHmmss"), "G")  #</span>
		<span #: DEL_ABL_YN == 'Y' ? 'class=delete' : '' # onclick="fn_deleteComment('#: REPLY_SEQ #')"></span>
	</div> <!--댓글내용-->
	</script>	
	
		<script type="text/javascript" src="/seize/cknw/CKNW1035.js"></script>
    </jsp:attribute>
</cb:pageWrapper>
