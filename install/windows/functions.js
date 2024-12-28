window.resizeTo(500, 500);
window.onload = displayCurrentYear;

function splitFilePath(filePath) {
  var normalizedPath = filePath.replace(/\\/g, '/');
  var lastSlashIndex = normalizedPath.lastIndexOf('/');
  var folder = normalizedPath.substring(0, lastSlashIndex);
  var filename = normalizedPath.substring(lastSlashIndex + 1);
  return [folder, filename];
}

function search() {
  var psd = document.getElementById('psd').value;

  if (!psd) {
    alert('You should choose a file to edit.');
    return;
  }

  var parts = splitFilePath(psd);
  var cmd =
    'docker run --rm --name annotald -p 8080:8080 -v ' +
    parts[0] +
    ':/data tychobrahe/annotald python bin/annotald /data/' +
    parts[1];

  var shell = new ActiveXObject('WScript.Shell');
  shell.Run('cmd.exe /c ' + cmd);

  checkServerStatus();
}

function displayCurrentYear() {
  var yearElement = document.getElementById('currentYear');
  var currentYear = new Date().getFullYear();
  yearElement.innerHTML = currentYear;
}

function checkServerStatus() {
  var xhr = new XMLHttpRequest();
  xhr.open('GET', 'http://localhost:8080', true);
  xhr.onreadystatechange = function () {
    // 4 means the request is complete
    if (xhr.readyState == 4) {
      if (xhr.status == 200) {
        var fso = new ActiveXObject(
          'Scripting.FileSystemObject'
        ).GetStandardStream(1);
        close(fso.Write('start http://localhost:8080'));
      } else {
        setTimeout(checkServerStatus, 100);
      }
    }
  };

  xhr.send(); // Send the request
}
