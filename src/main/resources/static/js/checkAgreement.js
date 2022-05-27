//체크박스 체크여부
$("input:checkbox").click(checkedChange);
	function checkedChange() {
       if($(this).prop("checked")){
       $("label[for="+this.id+"]").text("동의되었습니다.");
       $("label[for="+this.id+"]").css("color","blue");
   }else{
       $("label[for="+this.id+"]").text("동의 해주시기 바랍니다.");
       $("label[for="+this.id+"]").css("color","red");
       }
   }
