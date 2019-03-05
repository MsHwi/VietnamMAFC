<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="cb" tagdir="/WEB-INF/tags/corebase" %>
<%@ taglib prefix="cbt" uri="http://cbt.buttle.co.kr" %>
<cb:info>
<!-- 
 // ***********************************************************************************************
 // Program Name : [CCUS1010] Registered Customers
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2017. 10. 16
 // Description  : Registered Customers screen(등록고객조회 화면)
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
<cb:pageWrapper title="Registered Customers" id="CCUS1010" plugin="datepicker,grid,multicombo" pageType="">
    <jsp:attribute name="headWrapper"></jsp:attribute>
    <jsp:attribute name="bodyWrapper">
    
    <!--SearchArea-->
    <span class="Srchline"></span>
    <div class="SrchDiv" id="DIV_SRCH">
        <table cellspacing="0" class="SrchTBL">
            <colgroup>
                <col style="width:100px" />
                <col style="width:214px" />
                <col style="width:100px" />
                <col style="width:" />
                <col style="width:100px" />
                <col style="width:" />
                <col style="width:90px" />
                <col style="width:" />
                <col style="width:70px" />
                <col style="width:120px" />
                <col style="width:8px" />
            </colgroup>
            <tbody>
                <tr>
                	<th scope="row" title=""><cbt:message code="txt.678" text="Date" /></th>
                    <td>
                        <cb:datepicker id="SRCH_STR_DT" data-option="type:datepicker;dvalue:today-7d" data-name="txt.1081:Starting Date" data-valid="maxlength:8;require;" data-io="IO" class="point" />
                        <span>-</span>
                        <cb:datepicker id="SRCH_END_DT" data-option="type:datepicker;dvalue:today" data-name="txt.1331:End Date" data-valid="maxlength:8;require;" data-io="IO" class="point" />
                    </td>
                    <th><cbt:message code="txt.608" text="Cust Name" /></th>
                    <td><input type="text" id="CUST_NM" maxlength="100" data-name="txt.608:Cust Name" value="" data-io="IO" /></td>
                    <th><cbt:message code="txt.2004" text="Cust. ID No." /></th>
                    <td><input type="text" id="REALNM_NO" maxlength="64" data-name="txt.2004:Cust. ID No" value="" data-io="IO" /></td>
                    <th><cbt:message code="txt.1301" text="Phone No." /></th>
                    <td><input type="text" id="SRCH_TEL_NO" value="" data-option="type:phone;" data-name="txt.1301:Phone No." maxlength="40" class="onlyNumber" data-io="IO" /></td>
                    <th><cbt:message code="txt.1891" text="Area" /></th>
                    <td><cbt:combo code="TS_AREA" codeType="multi" data-option="event:init;top:ALL" id="AREA_CD" style="width: 100%;" data-name="txt.1891:Area" data-io="IO" /></td>
                </tr>
                <tr>
                	
                	<th><cbt:message code="txt.2240" text="Occupation" /></th>
                    <td><cbt:combo code="TS_JOB" codeType="multi" data-option="event:init;top:ALL" id="OCP_CD" data-name="txt.2240:Occupation" style="width:100%;" data-io="IO" /></td>
                    <th scope="row" title=""><cbt:message code="txt.972" text="Organization" /></th>
                    <td colspan="5">
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_CNTR_CD" data-option="event:init;type:dept-cntr;top:ALL"                             data-io="IO" style="width:20%;" />
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_GRP_CD"  data-option="event:init;type:dept-grp;top:ALL"  data-parent="#CMB_CNTR_CD"  data-io="IO" style="width:20%;" />
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_TEAM_CD" data-option="event:init;type:dept-team;top:ALL" data-parent="#CMB_GRP_CD"   data-io="IO" style="width:24%;" />
                        <cbt:combo code="" name="CMB_CNTR" id="CMB_USR_ID"  data-option="event:init;type:dept-user;top:ALL" data-parent="#CMB_TEAM_CD"  data-io="IO" style="width:34.5%;" />
                    </td>
                    <td class="btn" colspan="3">
                        <cb:button id="BTN_EXCEL" value="" class="btn_WF_excel" title="Excel" hidden="hidden"><cbt:message code="txt.1118" text="Excel" /></cb:button>
                        <cb:button id="BTN_SRCH" value="" title="Query" class="btn_WF_srch"><cbt:message code="txt.1324" text="Query" /></cb:button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!--//SearchArea-->
    
    <!--GridArea-->
    <section style="position:absolute; top:71px; right: 0; bottom:235px; left:0;">
        <!--Grid-->
        <article class="gridArea">
            <cb:grid style=" position:absolute; top:0; bottom:30px; width:100%;" data-option="type:spread">
                <table id="GRD_LIST" class="spread" data-spread="operationmode:3;scrollbars:virtual;pagesize:20;">
                    <thead>
                        <tr>
                            <cb:grid-column id="CUST_NM"			width="220px"   data-column="align:left;"><cbt:message  code="txt.608" text="Cust Name"  /></cb:grid-column>
                            <cb:grid-column id="REALNM_NO"			width="110px"   data-column="align:center;"><cbt:message code="txt.2004" text="Cust. ID No."  /></cb:grid-column>
                            <cb:grid-column id="BTDY"				width="110xp"   data-column="align:center;type:date;"><cbt:message code="txt.2015" text="Date of birth" /></cb:grid-column>
                            <cb:grid-column id="GNDR_DV_CD"			width="100px"   data-column="align:center;"><cbt:message code="txt.2371" text="Salutation" /></cb:grid-column>
                            <cb:grid-column id="MBPH_NO"			width="140px"   data-column="align:center;"><cbt:message code="txt.1291" text="Tel (Mobile)" /></cb:grid-column>
                            <cb:grid-column id="EML_ADDR"			width="200px"   data-column="align:left;"><cbt:message  code="txt.1182" text="E-mail" /></cb:grid-column>
                            <cb:grid-column id="ETC_TEL_NO"			width="140px"   data-column="align:center;"><cbt:message code="txt.2412" text="Tel (Phone)"/></cb:grid-column>
                            <cb:grid-column id="OWHM_ADDR"			width="250px"   data-column="align:left;"><cbt:message  code="txt.2258" text="Permanent Addr." /></cb:grid-column>
                            <cb:grid-column id="ETC_ADDR"			width="250px"   data-column="align:left;"><cbt:message code="txt.2000" text="Current Addr." /></cb:grid-column>
                            <cb:grid-column id="OCP_NM"				width="120px"   data-column="align:left;"><cbt:message code="txt.2240" text="Occupation" /></cb:grid-column>
                            <cb:grid-column id="AREA_NM"			width="80px"    data-column="align:center;"><cbt:message code="txt.1891" text="Area" /></cb:grid-column>
                            
                            <cb:grid-column id="WKPL_NM"			width="250px"   data-column="align:left;"><cbt:message code="txt.1969" text="Company Name" /></cb:grid-column>
                            <cb:grid-column id="WKPL_ADDR"			width="250px"   data-column="align:left;"><cbt:message code="txt.1966" text="Company Addr." /></cb:grid-column>
                            <cb:grid-column id="WKPL_TEL_NO"		width="140px"   data-column="align:center;"><cbt:message code="txt.1294" text="Tel (Company)" /></cb:grid-column>
                            <cb:grid-column id="FAX_NO"				width="140px"   data-column="align:center;"><cbt:message code="txt.1293" text="Tel (Fax)" /></cb:grid-column>
                            <cb:grid-column id="MM_SAL_AMT"			width="150px"   data-column="align:right;type:number;"><cbt:message code="txt.2135" text="Income Per Month" /></cb:grid-column>
                            <cb:grid-column id="CARR_TRM"			width="100px"   data-column="align:right;type:number;"><cbt:message code="txt.2483" text="Work period" /></cb:grid-column>
                            <cb:grid-column id="CONT_TRM_NM"		width="120px"   data-column="align:center;"><cbt:message code="txt.2465" text="Type of contract" /></cb:grid-column>
                            <cb:grid-column id="POSN_NM"            width="200px"   data-column="align:left;"><cbt:message code="txt.1365" text="Position" /></cb:grid-column>
                            <cb:grid-column id="SAL_PAYM_METH_NM"	width="150px"   data-column="align:center;"><cbt:message code="txt.2368" text="Sal Method" /></cb:grid-column>
                            <cb:grid-column id="MDIR_CRD_NM"		width="100px"   data-column="align:center;"><cbt:message code="txt.2122" text="Health card" /></cb:grid-column>

                            <cb:grid-column id="REG_DTM"		    width="180px"   data-column="align:center;type:datetime"><cbt:message code="txt.761" text="Reg. Date" /></cb:grid-column>

                            <!-- hidden -->	
                            <cb:grid-column id="OCP_CD"  			width=""   data-column="hidden;"></cb:grid-column>
                            <cb:grid-column id="AREA_CD"   			width=""   data-column="hidden;"></cb:grid-column>
                            <cb:grid-column id="CONT_TRM_CD"   		width=""   data-column="hidden;"></cb:grid-column>
                            <cb:grid-column id="MEMO"				width=""   data-column="hidden;"></cb:grid-column>
                            <cb:grid-column id="SAL_PAYM_METH_CD"	width=""   data-column="hidden;"></cb:grid-column>
                            <cb:grid-column id="MDIR_CRD_YN"		width=""   data-column="hidden;"></cb:grid-column>
                            
                        </tr>
                    </thead>
                </table>
            </cb:grid>
        </article>
    </section>
    <!--//GridArea-->
    
    <!--DetailArea-->
    <div id="DIV_DETAIL">
    <section style="position:absolute; right: 0; bottom:155px; left:0; ">
        <h4><cbt:message code="txt.2262" text="Personal information" /></h4>
            <table id="CUST_INFO_DTL" class="boxst01">
                <colgroup>
                    <col style="width:130px" />
                    <col style="width:80px" />
                    <col style="width:100px" />
                    <col style="width:50%" />
                    <col style="width:130px" />
                    <col style="width:145px" />
                    <col style="width:120px" />
                    <col style="width:25%" />
                    <col style="width:120px" />
                    <col style="width:25%" />
                </colgroup>
                <tbody>
                    <tr>
                        <th><cbt:message code="txt.608" text="Cust Name" /></th>
                        <td colspan="3"><input type="text" id="CUST_NM" value="" data-io="IO" readonly="readonly"/></td>
                        <th><cbt:message code="txt.2004" text="Cust. ID No." /></th>
                        <td><input type="text" id="REALNM_NO" value="" data-io="IO" readonly="readonly"/></td>
                        <th><cbt:message code="txt.2015" text="Date of birth" /></th>
                        <td><input type="text" id="BTDY" value="" data-option="type:date;" maxlength="8" data-io="IO" readonly="readonly"/></td>
                        <th><cbt:message code="txt.1891" text="Area" /></th>
                        <td><input type="text" id="AREA_NM" value="" data-io="IO" readonly="readonly"/></td>
                    </tr>
                    <tr>
                        <th><cbt:message code="txt.2258" text="Permanent Addr." /></th>
                        <td colspan="3"><input type="text" id="OWHM_ADDR" value="" data-io="IO" readonly="readonly"/></td>
                        <th><cbt:message code="txt.2000" text="Current Addr." /></th>
                        <td colspan="5"><input type="text" id="ETC_ADDR" value="" data-io="IO" readonly="readonly"/></td>
					 </tr>
                     <tr>
                        <th><cbt:message code="txt.2371" text="Salutation" /></th>
                        <td><input type="text" id="GNDR_DV_CD" value="" data-io="IO" readonly="readonly"/></td>
                        <th><cbt:message code="txt.1182" text="E-mail" /></th>
                        <td><input type="text" id="EML_ADDR" value="" data-io="IO" readonly="readonly"/></td>
                        <th><cbt:message code="txt.2240" text="Occupation" /></th>
                        <td><input type="text" id="OCP_NM" value="" data-io="IO" readonly="readonly"/></td>
                        <th><cbt:message code="txt.1291" text="Tel (Mobile)" /></th>
                        <td><input id="MBPH_NO" type="text" value="" data-option="type:phone;" style="width: 100%; text-align:left;" data-io="IO" class="onlyNumber" readonly="readonly"/></td>
                        <th><cbt:message code="txt.2412" text="Tel (Phone)" /></th>
                        <td><input type="text" id="ETC_TEL_NO" value="" data-option="type:phone;" class="onlyNumber" data-io="IO" readonly="readonly"/></td>
                    </tr>
				</tbody>
            </table>
		</section>
		<section style="position:absolute; right: 0; bottom:57px; left:0; ">
		 <h4><cbt:message code="txt.1968" text="Company information" /></h4>
            <table id="CUST_INFO_DTL" class="boxst01">
                <colgroup>
                    <col style="width:130px" />
                    <col style="width:80px" />
                    <col style="width:100px" />
                    <col style="width:50%" />
                    <col style="width:130px" />
                    <col style="width:145px" />
                    <col style="width:120px" />
                    <col style="width:25%" />
                    <col style="width:120px" />
                    <col style="width:25%" />
                </colgroup>
                <tbody>
                    <tr>
                        <th><cbt:message code="txt.1969" text="Company Name" /></th>
                        <td colspan="3"><input type="text" id="WKPL_NM" value="" data-io="IO" readonly="readonly"/></td>
                        <th><cbt:message code="txt.2135" text="Income Per Month" /></th>
                        <td><input type="text" id="MM_SAL_AMT" class="onlyNumber" data-option="type:number" value="" data-io="IO" readonly="readonly"/></td>
                        <th><cbt:message code="txt.2483" text="Work period" /></th>
                        <td><input type="text" id="CARR_TRM" value="" class="onlyNumber" data-option="type:number" style="width: calc(100% - 60px);" data-io="IO" readonly="readonly"/> (<cbt:message code="txt.2217" text="Months" />)</td>
                        <th><cbt:message code="txt.2465" text="Type of contract" /></th>
                        <td><input type="text" id="CONT_TRM_NM" value="" data-io="IO" readonly="readonly"/></td>
                    </tr>
                    <tr>
                    	<th><cbt:message code="txt.1966" text="Company Addr." /></th>
                        <td colspan="3"><input type="text" id="WKPL_ADDR" value="" data-io="IO" readonly="readonly"/></td>
                        <th><cbt:message code="txt.2368" text="Sal Method" /></th>
                        <td><input type="text" id="SAL_PAYM_METH_NM" value="" data-io="IO" readonly="readonly"/></td>
                        <th><cbt:message code="txt.1294" text="Tel (Company)" /></th>
                        <td><input type="text" id="WKPL_TEL_NO" data-option="type:phone;" value="" class="onlyNumber" data-io="IO" readonly="readonly"/></td>
                        <th><cbt:message code="txt.1293" text="Tel (Fax)" /></th>
                        <td><input type="text" id="FAX_NO" value="" class="onlyNumber" data-io="IO" readonly="readonly"/></td>
                    </tr>
                    <tr>
                    	<th><cbt:message code="txt.2122" text="Health card" /></th>
                        <td><input type="text" id="MDIR_CRD_NM" value="" data-io="IO" readonly="readonly"/></td>
                        <th><cbt:message code="txt.1365" text="Position" /></th>
                        <td><input type="text" id="POSN_NM" value="" data-io="IO" readonly="readonly"/></td>
                        <td colspan="2"></td>
                        <th><cbt:message code="txt.761" text="Reg. Date" /></th>
                        <td colspan="3"><input type="text" id="REG_DTM" value="" data-option="type:datetime;" data-io="IO" readonly="readonly"/></td>
                    </tr>
                </tbody>
            </table>
    </section>
    
    <!-- Remark area -->
        <section style="position:absolute; right: 0; left:0; bottom:0px;">
            <h4><cbt:message code="txt.904" text="Remark" /></h4>
            <table id="CUST_INFO_DTL" class="boxst01">
                <colgroup>
                    <col style="width:100%" />
                </colgroup>
                <tbody>
	                <tr>
	            		<td>
	                    	<textarea id="MEMO" data-io="IO" cols="1" rows="2" style="width:100%; height:100%;" readonly="readonly"></textarea>
	                    </td>
					</tr>
                </tbody>
            </table>
    </section>
    </div>
    <!--//DetailArea-->    
		 <script type="text/javascript" src="/seize/ccus/CCUS1010.js"></script> 
    </jsp:attribute>
</cb:pageWrapper>
