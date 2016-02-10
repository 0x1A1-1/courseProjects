#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <signal.h>
#include <unistd.h>

int count = 5; 

void handler_alm(int signo) {
	time_t curtime;
	time(&curtime);
	if (signo == SIGALRM) {
		printf("Current time = %s", ctime(&curtime));
		alarm(3);
	}

}

void handler_c(int signo) {
	count--;
	if(count != 0){
		printf("\nControl-c caught. %d more before program is ended.\n", count);
	}
	else{
		printf("\nFinal Control-c caught. Exiting.");
		exit(1);
	}
}

int main(){
	printf("Date will be printed every 3 seconds.\n");
	printf("Enter ^C 5 times to end the program:\n");

	struct sigaction sig_alm;
	struct sigaction sig_c;
	memset(&sig_alm, 0, sizeof(sig_alm));
	memset(&sig_c, 0, sizeof(sig_c));
	sig_alm.sa_handler = handler_alm;
	sig_c.sa_handler = handler_c;
	sigaction(SIGALRM, &sig_alm, NULL);
	sigaction(SIGINT, &sig_c, NULL);


	alarm(3); 

	while (1){
	} ; 

}
