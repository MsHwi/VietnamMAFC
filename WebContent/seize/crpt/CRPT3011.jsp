<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase"%>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr"%>
<cb:info>
<!-- 
 // ***********************************************************************************************
 // Program Name : [CRPT3011] SELLING PROGRESS 
 // Creator      : jekalhg@buttle.co.kr
 // Create Date  : 2018. 03. 19
 // Description  : SELLING PROGRESS
 // Modify Desc  : 
 // -----------------------------------------------------------------------------------------------
 // Date         | Updater        | Remark
 // -----------------------------------------------------------------------------------------------
 //     
 //        
 // ***********************************************************************************************/
-->
</cb:info>
<% // Plugins : grid,tab,datepicker,treeview - Use Keyword + "," %>
<cb:pageWrapper title="Selling Progress" id="CRPT3011" plugin="datepicker,grid,multicombo" pageType="">
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
                <col style="width:90px" />
                <col style="width:" />
                <col style="width:90px" />
                <col style="width:" />
                <col style="width:220px" />
            </colgroup>
            <tbody>
                 <tr>
                    <th scope="row" title=""><cbt:message code="txt.758" text="Period" /></th>
                    <td>
                        <cb:datepicker id="SRCH_YM" data-option="type:datepickerYM;dvalue:todayYM" data-io="IO" data-valid="maxlength:8;" class="point"/>
                    </td>
                    <th scope="row" title=""><cbt:message code="txt.1428" text="Campaign" /></th>
                    <td>
                        <cbt:combo code="selectList:CRPT3011.SELECT_CMP" codeType="multi" id="CMB_CMP_ID" style="width:100%;" data-io="IO" data-option="event:init;" class="point"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row" title=""><cbt:message code="txt.1021" text="Center" /></th>
                    <td>
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_CNTR_CD" data-option="event:init;type:dept-cntr;top:ALL"                             data-io="IO" style="width:100%;" />
                    </td>
                    <th scope="row" title=""><cbt:message code="txt.656" text="Group" /></th>
                    <td>
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_GRP_CD"  data-option="event:init;type:dept-grp;top:ALL"  data-parent="#CMB_CNTR_CD"  data-io="IO" style="width:100%;" />
                    </td>
                    <th scope="row" title=""><cbt:message code="txt.1502" text="Team" /></th>
                    <td>
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_TEAM_CD" data-option="event:init;type:dept-team;top:ALL" data-parent="#CMB_GRP_CD"   data-io="IO" style="width:100%;" />
                    </td>
                        <th scope="row" title=""><cbt:message code="txt.724" text="Agent" /></th>
                    <td>
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_USR_ID" data-option="event:init;type:dept-user;top:ALL" data-parent="#CMB_TEAM_CD"   data-io="IO" style="width:100%;" />
                    </td>
                    <td class="btn">
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
    <section style="position:absolute; top:65px; right:0; left:0; bottom:0;">
        <!--Grid-->
            <article class="gridArea">
                <cb:grid style=" position:absolute; top:0px; bottom:30px; width:100%;" data-option="type:spread">
                    <table id="GRD_RPT" class="spread" data-spread="operationmode:3;scrollbars:virtual;pagesize:20;rownum:0;">
                        <thead>
                            <tr>
                                <cb:grid-column id="MAIN_CATE"    width="100px"    data-column="align:center;sort:false;"><cbt:message code="txt.2195" text="Main Category" /></cb:grid-column>
                                <cb:grid-column id="SUB_CATE"     width="220px"    data-column="align:left;sort:false;"><cbt:message code="txt.2398" text="Sub Category" /></cb:grid-column>
                                <cb:grid-column id="CNT"          width="100px"    data-column="align:right;sort:false;"><cbt:message code="txt.570" text="Count" /></cb:grid-column>
                                <cb:grid-column id="PER"          width="100px"    data-column="align:right;sort:false;">%</cb:grid-column>
                            </tr>
                        </thead>
                    </table>
                </cb:grid>
            </article>
        </section>
    <!--//GridArea-->
    
        <script type="text/javascript" charset="utf-8" src="/seize/crpt/CRPT3011.js"></script>
        
    </jsp:attribute>
</cb:pageWrapper>
