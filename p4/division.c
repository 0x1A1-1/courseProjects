#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
int success=0;

void handler0(int signo){
   if (signo == SIGFPE) {
    printf("attempt to divide by 0\n");
		printf("Total number of success: %d\n", success);
    exit(1);
	}
}

void handler_c(int signo){
 if (signo == SIGINT) {
		printf("\nTotal number of success: %d\n", success);
    exit(1);
	}

}

int main(){
char * userinput1=malloc(100);
char * userinput2=malloc(100);
int int1, int2;
struct sigaction act0;
struct sigaction actc;
memset(&act0, 0, sizeof(act0));
memset(&actc, 0, sizeof(actc));
act0.sa_handler = handler0;
actc.sa_handler = handler_c;
sigaction(SIGINT, &actc, NULL);
sigaction(SIGFPE, &act0, NULL);

while(1){
printf("Enter first integer: ");
fgets(userinput1, 100, stdin);
printf("Enter second integer: ");
fgets(userinput2, 100, stdin);

int1=atoi(userinput1);
int2=atoi(userinput2);
printf("%d / %d is %d with a remainder of %d\n", int1, int2, (int1/int2), (int1%int2));
success++;
 }
return 0;
}
