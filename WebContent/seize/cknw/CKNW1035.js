
 // ***********************************************************************************************
 // Program Name : [CKNW1035] Knowledge View Script
 // Creator      : hwi@buttle.co.kr
 // Create Date  : 2017. 12. 26
 // Description  : Knowledge View(지식정보 Script)
 // Modify Desc  : 
 // -----------------------------------------------------------------------------------------------
 // Date         | Updater        | Remark
 // -----------------------------------------------------------------------------------------------
 //     
 //        
 // ***********************************************************************************************/

corebase.wrapping("#CKNW1035", function($cbwrap, $cbfind, corebase) {
	// Gloval Variable
	var parent = GV_PGM.source;
	var objsrc = null;
	var retSource = {};
	
	// docment ready 
	$cbfind(document).ready(function() {
		retSource.RESULT = false;
		
		fn_init();
		
		// like status button click
		$cbfind("#LKE_STAT").click(function() {
			fn_saveLike();
		});
		
		// delete button click
		$cbfind("#BTN_DEL_KNW").click(function() {
			if (objsrc.REG_ID != gfn_getUserInfo("GBL_USR_ID")) {
				return;
			}
			
			fn_deleteKnow();
		});
		
		// Comment Listview init...
		$cbfind("#LST_CMT").kendoListView({
			dataSource: null,
			template: kendo.template($cbfind("#rowTmplComment").html())
		});
		
		// Add Comment 
		$cbfind("#BTN_ADD_CMT").click(function() {
			if (CBData.isEmpty($cbfind("#CMMT").cbVal().trim())) {
				$cbfind("#CMMT").cbVal(""); 
				return;
			}
			
			fn_saveComment();
		});
	});
	
	// Initialize function
	function fn_init(obj) {
	
		if (!CBData.isEmpty(obj)) {
			parent = obj;
		}
	
		if (CBData.isEmpty(parent) || CBData.isEmpty(parent.KNW_INF_SEQNO)) {
			return;
		}
	
		$cbfind("#TB_KNW").cbClearOData();
		$cbfind("#KNW_CONT").html("");
		$cbfind("#FILE_VIEW").cbClearOData();
		
		corebase.select(parent, "CKNW1035.SELECT_KNW_ONE", function(output, metadata) {
			
			objsrc = output;
			
			$cbfind("#TB_KNW").cbBindData(output);
			if (output.LKE_YN == "Y") {
				$cbfind("#LKE_STAT").removeAttr("readonly");
			}
			if (output.REG_ID == gfn_getUserInfo("GBL_USR_ID")) {
				$cbfind("#BTN_DEL_KNW").removeAttr("readonly");
			}
			
			$cbfind("#KNW_CONT").html(output.KNW_CONT);
	
			// Save Read
			fn_saveRead(output);
	
			// Load Attachment
			corebase.selectList(parent, "CKNW1035.SELECT_LOAD_FILE", function(output, metadata) {
	
				if (output.length > 0) {
					// Attachment List
					var fileHtml = [];
					fileHtml.push('<tr valign="top">');
					fileHtml.push('    <td>');
					fileHtml.push('        <div id="DIV_APND_FILE" class="contents_list" style="">');
					fileHtml.push('            <ul id="DIV_APND_LIST">');
					fileHtml.push('            </ul>');
					fileHtml.push('        </div>');
					fileHtml.push('    </td>');
					fileHtml.push('</tr>');
	
					$cbfind("#FILE_VIEW").append(fileHtml.join(''));
	
					$cbwrap.each(output, function(i, iobj) {
						var $li = $cbfind('<li style="display:list-item; float:left; list-style-type:none; margin-right:10px;"><a href="#"><span class="stitT">' + iobj.FILE_NM + '</span><li>');
						$li.data('name', iobj.FILE_PHYS_NM).data('path', CBConfig.actions.fileRootDirectory).data('realname',iobj.FILE_NM);
	                                
						$li.click(function() {
							var name = $cbfind(this).data('name'),
							path = $cbfind(this).data('path'),
							realname = $cbfind(this).data('realname');
	
							CBFile.download(name, path, realname);
						});
						$cbfind("#DIV_APND_LIST").append($li);
					});
				}
				
				// Search Comments
				fn_srchComment(objsrc);
			});
		});
	}
	
	// Save Read History
	function fn_saveRead(obj) {
		corebase.insert(obj, "CKNW1035.MERGE_KNW_READ", function (output, metadata) {
		});
	}
	
	// Update Like
	function fn_saveLike() {
		var option = {};
		var data = {};
		
		objsrc.LKE_YN = objsrc.LKE_YN == "Y" ? "N" : "Y";
		
		data.T1_UPDATE_KNW_LIKE = corebase.Input("update", "CKNW1035.UPDATE_KNW_LIKE", objsrc);
		data.T2_SELECT_KNW_LKE_AFTER = corebase.Input("select", "CKNW1035.SELECT_KNW_LKE_AFTER", objsrc);
		option.data = data;
		
		corebase.ajax(option, function (output, metadata) {
			
			objsrc.LKE_YN = output.T2_SELECT_KNW_LKE_AFTER.LKE_YN;
			$cbfind("#TB_KNW").cbBindData(output.T2_SELECT_KNW_LKE_AFTER);
			
			if (objsrc.LKE_YN == "Y") {
				$cbfind("#LKE_STAT").removeAttr("readonly");
			} else {
				$cbfind("#LKE_STAT").attr("readonly", "readonly");
			}
	
			retSource.RESULT = true;
		});
	}
	
	// Delete Knowledge
	function fn_deleteKnow() {
		if (!cb.confirm(cb.locMessage("msg.171", "Are you sure you want to delete?"))) {
			return;
		}
	
		corebase.update(objsrc, "CKNW1020.DELETE_KNW", function(output, metadata) {
			CBMsg.error(cb.locMessage("msg.168", "Removed."));
			retSource.RESULT = true;
			corebase.closeWindow(retSource);
		});
	}
	
	// Search Comment
	function fn_srchComment(obj) {
		corebase.selectList(obj, "CKNW1035.SELECT_KNW_CMMT", function(output, metadata) {
			var SELECT_KNW_CMMT = new kendo.data.DataSource({data:output});
			$cbfind("#LST_CMT").data("kendoListView").setDataSource(SELECT_KNW_CMMT);
		});
	}
	
	// Save Comment
	function fn_saveComment() {
		var source = objsrc;
		source.CMMT = $cbfind("#CMMT").cbVal();
		
		corebase.insert(source, "CKNW1035.INSERT_KNW_CMMT", function(output, metadata) {
			$cbfind("#CMMT").cbVal("");
			fn_srchComment(objsrc);
			retSource.RESULT = true;
		});
	}
	
	// Delete Comment
	fn_deleteComment = function(cmmtSeq) {
		
		if (!cb.confirm(cb.locMessage("msg.171", "Are you sure you want to delete?"))) {
			return;
		}
		
		var source = {};
		source.KNW_INF_SEQNO = objsrc.KNW_INF_SEQNO;
		source.REPLY_SEQ = cmmtSeq;
		
		corebase.update(source, "CKNW1035.DELETE_KNW_CMMT", function(output, metadata) {
			fn_srchComment(objsrc);
			retSource.RESULT = true;
		});
	}
	
	// Corebase reload event
	corebase.reload = function(obj){
		fn_init(obj);
	};
	
	// browser close button click event(return data)
	window.onbeforeunload = function () {
		corebase.closeWindow(retSource);
	};
});