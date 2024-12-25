window.onload = displayCurrentYear;
window.onload = displayCurrentYear;

function executeScript() {
  const scriptPath = './annotald.sh';
  // Using Node.js for simplicity to run the shell script
  const { exec } = require('child_process');
  exec(`bash ${scriptPath}`, (error, stdout, stderr) => {
    if (error) {
      console.error(`Error executing script: ${error.message}`);
      return;
    }
    if (stderr) {
      console.error(`Shell script error: ${stderr}`);
      return;
    }
    console.log(`Output: ${stdout}`);
  });
}

function displayCurrentYear() {
  const yearElement = document.getElementById('currentYear');
  const currentYear = new Date().getFullYear();
  yearElement.innerHTML = currentYear;
}
