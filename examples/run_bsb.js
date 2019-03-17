/*
We need this script to consistently run BSB on Unix & Windows based systems
*/

const fs = require("fs");
const child_process = require("child_process");
const path = require("path");

const spawn = child_process.spawn;

const isWindows = /^win/i.test(process.platform);

function copyWindowsExe() {
  const base = path.join(__dirname, "..", "src", "lib", "bs", "native");
  if (isWindows) {
    fs.copyFileSync(path.join(base, "gentype.native.exe"), path.join(base, "gentype.native"));
  }
}

const input = (args = process.argv.slice(2));

const shell = isWindows ? true : false;

copyWindowsExe();

spawn("bsb", input, { stdio: ["inherit", "inherit"], shell }).on(
  "exit",
  code => process.exit(code)
);
