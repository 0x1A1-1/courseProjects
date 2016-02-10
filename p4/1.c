#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <signal.h>
#include <unistd.h>

void handler(int signo) {
   time_t curtime;
   time(&curtime);

	if (signo == SIGALRM) {
   printf("Current time = %s", ctime(&curtime));
   alarm(3);
	}
}

int main(int argc, char *argv[]) {
  printf("%% intdate:\n");
  printf("Date will be printed every 3 seconds.\n");
  printf("Enter ^C to end the program:\n");

	struct sigaction sig;
	//memset(&act, 0, sizeof(act));
	sig.sa_handler = handler;
	alarm(3);
  sigaction(SIGALRM, &sig, NULL);
	while (1){} ; // spin
  
}