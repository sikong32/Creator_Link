async function val_check() {
	var editorData = editor.getData();
	var f = document.getElementById('form_input');
	// 에디터의 유효성 검사
	if (f.checkValidity()) {
		if (editorData == "") {
			alert("상세페이지는 비우면 안됩니다.");
		} else {
			// 데이터를 파일로 변환
			editorData = await processImages(editorData);
			editor.setData(editorData);
			f.submit();
		}
	} else {
		// 유효하지 않은 경우 폼을 제출하지 않고 에러 메시지 표시
		f.reportValidity();
	}
}
async function processImages(data) {
	const image_div = document.createElement('div');
	image_div.innerHTML = data;

	const images = image_div.querySelectorAll('img');
	const resizePromises = [];

	images.forEach(img => {
		if (img.src.startsWith('data:image/')) { // BASE64 인코딩된 PNG 이미지인 경우
			const promise = resizeBase64Img(img.src, 800, 800).then(function (resizedImgData) { // 이미지 크기 조정
				img.src = resizedImgData; // 조정된 이미지 데이터로 src 속성 업데이트
			});
			resizePromises.push(promise);
		} else if (img.src.startsWith('http')) {
			const image = new Image();
			image.onload = function () {
				// 이미지의 너비가 800px을 초과하는지 확인
				if (this.width > 800) {
					// 조건을 만족하면 img 태그의 너비를 800px로 설정
					img.style.width = "800px";
					img.style.height = "auto"; // 높이는 자동으로 조정
				}
			};
			image.src = img.src;
		}
	});
	//모든 이미지 크리 조정이 끝날 때 까지 기다리기
	await Promise.all(resizePromises);
	return image_div.innerHTML;
}
function resizeBase64Img(base64, maxWidth, maxHeight) {
	return new Promise((resolve, reject) => {
		let img = new Image();
		img.src = base64;
		img.onload = () => {
			let canvas = document.createElement('canvas');
			let width = img.width;
			let height = img.height;

			// 너비와 높이 조정 로직
			if (width > maxWidth) {
				height *= maxWidth / width;
				width = maxWidth;
			}
			if (height > maxHeight) {
				width *= maxHeight / height;
				height = maxHeight;
			}

			canvas.width = width;
			canvas.height = height;
			let ctx = canvas.getContext('2d');
			ctx.drawImage(img, 0, 0, width, height);
			resolve(canvas.toDataURL()); // 조정된 이미지를 BASE64 문자열로 변환
		};
		img.onerror = reject;
	});
}