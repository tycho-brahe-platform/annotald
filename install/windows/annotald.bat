<!-- :
@echo on
setlocal EnableDelayedExpansion

docker rm -f annotald || true

if "%~1" equ "/?" (
	echo Creates an input value window and output
	echo   the result to console or assign it to variable
	echo   if variable name is passed
	(echo()
	echo Usage:
	(echo()
	echo %~0nx [storeInputTo]
)
for /f "tokens=* delims=" %%p in ('mshta.exe "%~f0"') do (
    set "input=%%p"
)
%input%

exit /b
-->

<html>
<head>
	<title>Annotald</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
    <script src="functions.js"></script>
</head>
<body>
	<div class="container">
        <div class="header">
            <img src="annotald.png" class="logo" alt="Annotald Logo" />
            <h1>Welcome to Annotald</h1>
            <h2>Select below a PSD file to edit</h2>
        </div>
        <main>
            <div class="custom-file-input">
                <input type="file" id="psd" />
            </div>
            <button class="execute-btn" onclick="search()">Execute</button>
        </main>
        <footer>
            <h6>* Your default browser will open automatically after the file is loaded *</h6>
            <hr />
            <p><span id="currentYear"></span>&nbsp;Annotald</p>
        </footer>
    </div>
</body>
</html>