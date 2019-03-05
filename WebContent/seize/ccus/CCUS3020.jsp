<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase" %>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr" %>
<cb:info>
<!-- 
 // ***********************************************************************************************
 // Program Name : [CCUS3020] Register Customer Status
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2017. 10. 25
 // Description  : Register Customer Status screen(고객 관리상태 등록 화면)
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
<cb:pageWrapper title="Register Customer Status" id="CCUS3020" plugin="datepicker,grid" pageType="popup">

    <jsp:attribute name="headWrapper"></jsp:attribute>
    <jsp:attribute name="bodyWrapper">
    
        <section style="position:absolute; top:0px; right: 0; left:0;">
            <h4><cbt:message code="txt.638" text="Registration history of management status" /></h4>
        </section>
    
        <!--GridArea-->
        <section style="position:absolute; top:20px; right: 0; left:0; height: 270px;">
            <!--Grid-->
            <article class="gridArea">
                <cb:grid style=" position:absolute; top:0; bottom:38px; width:100%;" data-option="type:spread">
                    <table id="GRD_LIST" class="spread" data-spread="operationmode:3">
                        <thead>
                            <tr>
                                <cb:grid-column id="REG_DTM"       width="180px"   data-column="align:center;type:datetime;"><cbt:message code="txt.678" text="Date" /></cb:grid-column>
                                <cb:grid-column id="USR_NM"        width="170px"   data-column="align:left;"><cbt:message code="txt.724" text="Agent" /></cb:grid-column>
<%--                                 <cb:grid-column id="MNG_STS_NM"    width="110px"   data-column="align:center;"><cbt:message code="txt.636" text="Mgt. Status" /></cb:grid-column> --%>
                                <cb:grid-column id="REG_CTT"       width="*"       data-column="align:left;"><cbt:message code="txt.904" text="Remark" /></cb:grid-column>
                                <cb:grid-column id="MGR_STS_CD"                    data-column="hidden"></cb:grid-column>
                            </tr>
                        </thead>
                    </table>
                </cb:grid>
            </article>
        </section>
        <!--//GridArea-->
        
        <!--DetailArea-->
        <section style="position:absolute; top:260px; right:0; left:0;">
            <section style="position:absolute; top:0px; right: 0; left:0;">
                <h4><cbt:message code="txt.600" text="Register Status of Customer management" /></h4>
            </section>
            <section style="position:absolute; top:30px; right: 0; left:0;">
            <!--boxst01-->
            <div id="DIV_DETAIL">
                <table class="boxst01">
                    <colgroup>
                        <col style="width:16%" />
                        <col style="width:32%" />
                        <col style="width:" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><cbt:message code="txt.606" text="Name" /></th>
                            <td><input id="CUST_NM" type="text" style="width:100%" data-io="IO" maxlength="100" readonly="readonly"/></td>
                            <td></td>
                        </tr>
<!--                         <tr> -->
<%--                             <th><cbt:message code="txt.636" text="Mgt. Status" /></th> --%>
<%--                             <td><cbt:combo code="MGNT_ST" codeType="SEL" id="MGR_STS_CD" style="width: 100%; text-align:left;" data-io="IO" class="point"/></td> --%>
<!--                             <td></td> -->
<!--                         </tr> -->
<!--                         <tr> -->
<%--                             <th style="white-space:normal;"><cbt:message code="txt.639" text="Information of management status" /></th> --%>
<!--                             <td colspan="2"><textarea id="MNG_STATE_MEMO" class="autosize" data-io="IO" data-name="txt.639:Information of management status" cols="1" rows="3" maxlength="1000" readonly="readonly" style="width:100%; height:66px; overflow:hidden;" maxlength="300"></textarea></td> -->
<!--                         </tr> -->
                        <tr>
                            <th><cbt:message code="txt.904" text="Remark" /></th>
                            <td colspan="2"><textarea id="REG_CTT" data-io="IO" data-name="txt.904:Remark" cols="1" rows="3" style="width:100%; height:66px;" maxlength="2000"></textarea></td>
                        </tr>
                        <input type="hidden" id="CUST_NO"  data-io="IO" />
                        <input type="hidden" id="CALL_CNSL_ID" data-io="IO"/>
                    </tbody>
                </table>
            </div>
            </section>
            <!--//boxst01-->
        </section>
        <!--//DetailArea-->
        
        <!--buttonArea-->
        <section style="position:absolute; bottom:0; right: 0; left:0;">
            <div class="botmBtn_rig">
                <cb:button id="BTN_NEW"  title="Initialize"  class="btn_WF_act"  data-atht="W"><cbt:message code="txt.1398" text="Initialize" /></cb:button>
                <cb:button id="BTN_SAVE" title="Save"  class="btn_WF_save" data-atht="W"><cbt:message code="txt.1275" text="Save" /></cb:button>
            </div>
        </section>
        <!--//buttonArea-->
        		   
    	<script type="text/javascript" src="/seize/ccus/CCUS3020.js"></script>   
    </jsp:attribute>
</cb:pageWrapper>
