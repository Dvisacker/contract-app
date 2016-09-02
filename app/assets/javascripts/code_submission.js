$(document).ready(function() {

	var code = $(".codemirror-textarea")[0];
	var editor = CodeMirror.fromTextArea(code , {
		mode: 'text/html',
		styleActiveLine: true,
		keyMap: "sublime",
		lineNumbers : true,
		autoCloseBrackets: true,
		closeBrackets: true,
		matchBrackets: true,
		theme : "monokai",
		showCursorWhenSelecting: true,
		tabSize: 2
	});
});
