<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function addOptionFields() {
    var optionCount = document.getElementById("pd_option_su").value;
    var optionContainer = document.getElementById("option_container");
    optionContainer.innerHTML = ""; // Clear previous fields
    
    for (var i = 1; i <= optionCount; i++) {
    	var optionFields = '<li>' +
        i + '번 옵션 이름<input type="text" name="os_' + i + 'name">' +
        i + '번 옵션 가격<input type="text" name="os_' + i + 'priec">' +
        i + '번 옵션 이미지<input type="file" name="os_' + i + 'photo">' +
        i + '번 옵션 재고<input type="number" min="0" name="os_' + i + 'stock">' +
        '</li>';
        optionContainer.innerHTML += optionFields;
    }
}
</script>
</head>
<body>
	<form action="store_save" method="post" enctype="multipart/form-data">
		<div>
			<ul>
				<li>상품카테고리</li>
				<li><input type="text" name="pd_category"></li>
				<li>상품명</li>
				<li><input type="text" name="pd_name"></li>
				<li>상품가격</li>
				<li><input type="text" name="pd_price"></li>
				<li>상품대표 이미지</li>
				<li><input type="file" name="pd_pohto"></li>
				<li>1번째 옵션 분류</li>
				<li><select id="pd_option_su" name = "pd_option_su" onchange="addOptionFields(this)">
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
				</select></li>
				<li>2번째 옵션 분류</li>
				<li><select id="pd_option_su" name = "pd_option_su" onchange="addOptionFields(this)">
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
				</select></li>
				<li>3번째 옵션 분류</li>
				<li><select id="pd_option_su" name = "pd_option_su" onchange="addOptionFields(this)">
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
				</select></li>
				<li id="option_container"></li>
        		<li>상품 재고</li>
				<li><input type="number" min="0" id="pd_stock" name="pd_stock"></li>
				<li>상세페이지</li>
				<li><textarea id="editor" name="pd_content" cols="20" rows="5"></textarea></li>
				<li><input type="submit" value="전송"></li>
			</ul>
		</div>

		<!-- 			<tr> -->
		<!-- 				<th>1번 옵션</th> -->
		<!-- 				<td> -->
		<!-- 				옵션 이름<input type="text" name="os_1name"> -->
		<!-- 				옵션 가격<input type="text" name="os_1priec"> -->
		<!-- 				옵션 이미지<input type="file" name="os_1photo"> -->
		<!-- 				옵션 재고<input type="number" min="0" name="os_1stock"> -->
		<!-- 				</td> -->
		<!-- 			</tr> -->
		<!-- 			<tr> -->
		<!-- 				<th>2번 옵션</th> -->
		<!-- 				<td> -->
		<!-- 				옵션 이름<input type="text" name="os_2name"> -->
		<!-- 				옵션 가격<input type="text" name="os_2priec"> -->
		<!-- 				옵션 이미지<input type="file" name="os_2photo"> -->
		<!-- 				옵션 재고<input type="number" min="0" name="os_2stock"> -->
		<!-- 				</td> -->
		<!-- 			</tr> -->
		<!-- 			<tr> -->
		<!-- 				<th>3번 옵션</th> -->
		<!-- 				<td> -->
		<!-- 				옵션 이름<input type="text" name="os_3name"> -->
		<!-- 				옵션 가격<input type="text" name="os_3priec"> -->
		<!-- 				옵션 이미지<input type="file" name="os_3photo"> -->
		<!-- 				옵션 재고<input type="number" min="0" name="os_3stock"> -->
		<!-- 				</td> -->
		<!-- 			</tr> -->
	</form>
</body>
<script>
            // This sample still does not showcase all CKEditor 5 features (!)
            // Visit https://ckeditor.com/docs/ckeditor5/latest/features/index.html to browse all the features.
            CKEDITOR.ClassicEditor.create(document.getElementById("editor"), {
                // https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format
                toolbar: {
                    items: [

                        'heading', '|',
                        'bold', 'italic', '|',
                        'bulletedList', 'numberedList', 'todoList', '|',
                        'outdent', 'indent', '|',
                        'undo', 'redo',
                        '-',
                        'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', '|',
                        'specialCharacters', 'horizontalLine', '|',
                        //'textPartLanguage', '|',
						//'sourceEditing'
                    ],
                    shouldNotGroupWhenFull: true
                },
                // Changing the language of the interface requires loading the language file using the <script> tag.
                // language: 'es',
                list: {
                    properties: {
                        styles: true,
                        startIndex: true,
                        reversed: true
                    }
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
                heading: {
                    options: [
                        { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                        { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
                        { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
                        { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
                        { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
                        { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
                        { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
                    ]
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
                placeholder: '내용을 입력 해주세요.',
                // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
                fontFamily: {
                    options: [
                        'default',
                        'Arial, Helvetica, sans-serif',
                        'Courier New, Courier, monospace',
                        'Georgia, serif',
                        'Lucida Sans Unicode, Lucida Grande, sans-serif',
                        'Tahoma, Geneva, sans-serif',
                        'Times New Roman, Times, serif',
                        'Trebuchet MS, Helvetica, sans-serif',
                        'Verdana, Geneva, sans-serif'
                    ],
                    supportAllValues: true
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
                fontSize: {
                    options: [ 10, 12, 14, 'default', 18, 20, 22 ],
                    supportAllValues: true
                },
                // Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
                // https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
                htmlSupport: {
                    allow: [
                        {
                            name: /.*/,
                            attributes: true,
                            classes: true,
                            styles: true
                        }
                    ]
                },
                // Be careful with enabling previews
                // https://ckeditor.com/docs/ckeditor5/latest/features/html-embed.html#content-previews
                htmlEmbed: {
                    showPreviews: true
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/link.html#custom-link-attributes-decorators
                link: {
                    decorators: {
                        addTargetToExternalLinks: true,
                        defaultProtocol: 'https://',
                        toggleDownloadable: {
                            mode: 'manual',
                            label: 'Downloadable',
                            attributes: {
                                download: 'file'
                            }
                        }
                    }
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/mentions.html#configuration
                mention: {
                    feeds: [
                        {
                            marker: '@',
                            feed: [
                                '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
                                '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
                                '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
                                '@sugar', '@sweet', '@topping', '@wafer'
                            ],
                            minimumCharacters: 1
                        }
                    ]
                },
                // The "super-build" contains more premium features that require additional configuration, disable them below.
                // Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
                removePlugins: [
                    // These two are commercial, but you can try them out without registering to a trial.
                    // 'ExportPdf',
                    // 'ExportWord',
                    'CKBox',
                    'CKFinder',
                    'EasyImage',
                    // This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
                    // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
                    // Storing images as Base64 is usually a very bad idea.
                    // Replace it on production website with other solutions:
                    // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
                    // 'Base64UploadAdapter',
                    'RealTimeCollaborativeComments',
                    'RealTimeCollaborativeTrackChanges',
                    'RealTimeCollaborativeRevisionHistory',
                    'PresenceList',
                    'Comments',
                    'TrackChanges',
                    'TrackChangesData',
                    'RevisionHistory',
                    'Pagination',
                    'WProofreader',
                    // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
                    // from a local file system (file://) - load this site via HTTP server if you enable MathType
                    'MathType'
                ]
            });
        </script>
</html>