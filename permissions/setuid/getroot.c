#include <stdio.h>
#include <unistd.h>



int main(){
  uid_t uid=getuid(), euid=geteuid();
  if (uid<0 || uid!=euid){
    setuid(0);
    printf("Now you are root!\n")
    char *args[2];
    args[0] = "/bin/bash";
    args[1] = NULL;
    execve(args[0], args, NULL);
  } 
  else {
    printf("Please add the SUID bit to the file\n");
  }
}
