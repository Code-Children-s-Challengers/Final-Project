var sel_file;
//프로필 이미지 미리보기 기능
$("table").on("change","#profileImage",handleProfileImage);
console.log("hi@");

function handleProfileImage(e){
		console.log("hi")
	var files = e.target.files;
	var filesArr =Array.prototype.slice.call(files);
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e){
			$("#profile").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
}