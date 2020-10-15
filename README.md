# Checker
This is a simple script, which can check your module compilation with different headers (only for Centos and Cloud Linux).

!!!Attention this script expects you to build your module in directory "/lib/modules/`uname -r`/build" otherwise this script cannot work. !!!


# How to use it:
1) Install docker on your machine.
2) Build image using Dockerfile, run command in "general" directory
run command: "docker build -t checker ."

3) Download needed headers and move it to "LinuxHeaders" directory.
4) There is a file named "versions" in directory "checker" add all names of headers you download.

Example of file "versions":
3.10.0-123.el7.x86_64
2.6.32-431.el6.x86_64
3.10.0-962.3.2.lve1.5.33.el7.x86_64
2.6.32-954.3.5.lve1.4.63.el6.x86_64
2.6.32-71.el6.x86_64

5) Move module which you want to test in "Module" directory


6) You are ready to test your module, run command in "general" directory
run command: "docker run --rm -v $(pwd)/LinuxHeaders:/LinuxHeader -v $(pwd)/Module:/Module -v $(pwd)/checker:/checker checker /checker/checkscript.sh /Module/PATH_TO_MODULE_MAKEFILE /checker" 

7) If you need to change something start from step 3).
