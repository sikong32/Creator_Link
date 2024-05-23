function val_check() {
    var editorData = editor.getData();
    var f = document.getElementById('form_input');

    // 에디터의 유효성 검사
    if (f.checkValidity()) {
        if (editorData == "") {
            alert("내용은 비우면 안됩니다.");
        } else {
            // 데이터를 파일로 변환
            processImages(editorData)
                .then(processedData => {
                    editor.setData(fontdel(processedData));
                    f.submit();
                })
                .catch(error => {
                    console.error("이미지 처리 중 오류 발생:", error);
                });
        }
    } else {
        // 유효하지 않은 경우 폼을 제출하지 않고 에러 메시지 표시
        f.reportValidity();
    }
}

function processImages(data) {
    return new Promise((resolve, reject) => {
        const image_div = document.createElement('div');
        image_div.innerHTML = data;

        const images = image_div.querySelectorAll('img');
        const resizePromises = [];

        images.forEach(img => {
            if (img.src.startsWith('data:image/')) { // BASE64 인코딩된 PNG 이미지인 경우
                resizePromises.push(resizeBase64Img(img.src, 800, "auto")
                    .then(resizedImgData => {
                        img.src = resizedImgData; // 조정된 이미지 데이터로 src 속성 업데이트
                    })
                    .catch(error => {
                        console.error("이미지 리사이징 오류:", error);
                    }));
            } else if (img.src.startsWith('http')) {
                const imagePromise = new Promise((resolveImage, rejectImage) => {
                    const image = new Image();
                    image.onload = () => {
                        // 이미지의 너비가 800px을 초과하는지 확인
                        if (image.width > 800) {
                            // 조건을 만족하면 img 태그의 너비를 800px로 설정
                            img.style.width = "800px";
                            img.style.height = "auto"; // 높이는 자동으로 조정
                        }
                        resolveImage();
                    };
                    image.onerror = rejectImage;
                    image.src = img.src;
                });
                resizePromises.push(imagePromise);
            }
        });

        // 모든 이미지 크기 조정 및 로딩이 완료된 후에 resolve
        Promise.all(resizePromises)
            .then(() => {
                resolve(image_div.innerHTML);
            })
            .catch(error => {
                reject(error);
            });
    });
}

function resizeBase64Img(base64, maxWidth, maxHeight) {
    return new Promise((resolve, reject) => {
        let img = new Image();
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
        img.src = base64;
    });
}
function fontdel(processedData) {
	const data_div = document.createElement('div');
	data_div.innerHTML = processedData;
    
    const allElements = data_div.querySelectorAll('*');
    allElements.forEach(element => {
        element.style.removeProperty('font-family');
    });
    return data_div.innerHTML;
}