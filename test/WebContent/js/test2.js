/**
 * 
 */

$(document).ready(function() {
	alert("L06");
	console.log("comInfo", comInfo);
	console.log("appkey", appkey);
	console.log("hash", hash);

	$("#termList li[data-mandatory-yn='Y']").first().prepend("<p style='margin-bottom:12px; font-weight:bold'>[필수]</p>")
	$("#termList li[data-mandatory-yn='N']").first().prepend("<p style='margin-bottom:12px; font-weight:bold'>[선택]</p>")
	
	
	agreeCheckUI(checkboxCheck(), mandatoryCheck()); 

	$("#checkBtn input:checkbox").prop('checked', false);
	
	$("input:checkbox").change(function() {
		alert("L20");
		if($(this).hasClass("checkAll")) {
			$(this).parents('div').first().find('ul.termList').find('li').find('input').prop('checked', false);
		}else if($(this).hasClass("removeAll")) {
			$(this).parents('div').first().find('ul.termList').find('li').find('input').prop('checked', true);
		}
		
		agreeCheckUI(checkboxCheck(), mandatoryCheck());
		
		if(!$("#agreeBtnWrap > div").hasClass("termsSelect")){
			$("#agreeBtnWrap > div").addClass("termsSelect");
		}
	
		$(".termList2 li input:checkbox").prop("checked",checkboxCheck());
	
	});


	$(".termList2 li input:checkbox").prop("checked",checkboxCheck());

});//end ready










function agreeProp() {

if(!$("#agreeBtnWrap > div").hasClass("termsSelect")){

return false;

}

if(!mandatoryCheck()){

delTerms();

}else{

modTerms();

}

}

function delTerms(){

var params = new Object();

$.ajax({

type : "DELETE",

url : "/poi/terms",

data : JSON.stringify(params),

async : false,

contentType:"application/json; charset=utf-8",

dataType : "json",

beforeSend: function(request) {

request.setRequestHeader("hash", hash);

request.setRequestHeader("appkey", appkey);

request.setRequestHeader("com_info", comInfo);

},

error : function() {

console.log("AJAX ERROR");

poiCallbackAlert(poiMessage.actionFail, function(){

closeApp();

});

},

statusCode : {

440 : function() {

console.log("session expired");

poiCallbackAlert(poiMessage.sessionTimeout, function(){

terminateApp();

e.preventDefault();

});

}

},

success : function(data) {

console.log("Success", data);

if(data.data.ERRCODE == "0"){

changeServiceStatus("OFF");

poiCallbackAlert(poiMessage.moveModifyTerms, function(){

closeApp();

});

}else{

poiCallbackAlert(poiMessage.errorModifyTerms +  " ["+ data.data.ERRMSG +"]" , function(){

closeApp();

});

}

}

});

}




function modTerms(){

var termsList = $("#termList li");

var params = new Object();

var agreeList = new Array();

termsList.each(function(i){

var agreeObject = new Object();

agreeObject.terms_id = String($(this).data("termsId"));

agreeObject.terms_ver = $(this).data("version");

agreeObject.terms_agree_yn = $(this).find("input:checkbox").is(":checked")? "Y":"N";

agreeList.push(agreeObject);

});

params.terms_agree_list = agreeList;

console.log("params",params);

$.ajax({

type : "PUT",

url : "/poi/terms",

data : JSON.stringify(params),

async : false,

contentType:"application/json; charset=utf-8",

dataType : "json",

beforeSend: function(request) {

request.setRequestHeader("hash", hash);

request.setRequestHeader("appkey", appkey);

request.setRequestHeader("com_info", comInfo);

},

error : function() {

console.log("AJAX ERROR");

poiCallbackAlert(poiMessage.actionFail, function(){

closeApp();

});

},

statusCode : {

440 : function() {

console.log("session expired");

poiCallbackAlert(poiMessage.sessionTimeout, function(){

terminateApp();

e.preventDefault();

});

}

},

success : function(data) {

console.log("Success", data);

if(data.data.ERRCODE == "0"){

poiCallbackAlert(poiMessage.successModifyTerms, function(){

closeApp();

});

}else{

poiCallbackAlert(poiMessage.errorModifyTerms +  " ["+ data.data.ERRMSG +"]" , function(){

closeApp();

});

}

}

});

}




function checkboxCheck() {
	alert("checkboxCheck");
	var termList = $("#termList");
	
	alert(termList);
	alert(termList.find("li input:checkbox:checked").length);
	alert(termList.find("li input:checkbox").length);
	
	//return true;
	
	if (termList.find("li input:checkbox:checked").length < 1) { // termList.find("li input:checkbox").length
		return true;
	} else {
		return false;
	}
}

function mandatoryCheck(){
	alert("mandatoryCheck");
	//return false;
	
	var mandatoryList = $("#termList li[data-mandatory-yn='Y']");
	
	alert(mandatoryList.find("input:checkbox:checked").length);
	alert(mandatoryList.length);
	
	
	if(mandatoryList.find("input:checkbox:checked").length != mandatoryList.length){// 체그된것 != 체크
		return false;
	}else{
		return true
	}
}

function agreeCheckUI(checkboxCheck, mandatoryCheck){
	alert("agreeCheckUI");
	if (checkboxCheck) {
		//$(".checkShowHide1").show();
		//$(".checkShowHide2").hide();
		$("#checkBtn input:checkbox").prop('checked', true);
	} else {
		//$(".checkShowHide1").hide();
		//$(".checkShowHide2").show();
		$("#checkBtn input:checkbox").prop('checked', false);
	}
	
	if (mandatoryCheck) {
		$(".termShowHide1").show();
		$(".termShowHide2").hide();
	} else {
		$(".termShowHide1").hide();
		$(".termShowHide2").show();
	}

}

