Computers execute software to get stuff done.
In modern computing, this software is split into two categories: _operating system kernels_ (about which we will learn [much later](/system-security)) and _processes_, which we will discuss here.
When Linux starts up, it launches an _init_ (short for initializer) process that, in turn, launches a bunch of other processes which launch more processes until, eventually, you are looking at your command line shell, which is also a process!
The shell, of course, launches processes in response to the commands you enter.

In this module, we will learn to view and interact with processes in a number of exciting ways!
