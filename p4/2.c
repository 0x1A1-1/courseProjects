#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <signal.h>
#include <unistd.h>
int times = 5;

void handler(int signo) {
	time_t curtime;
	time(&curtime);
	if (signo == SIGALRM) {
		printf("Current time = %s", ctime(&curtime));
		alarm(3);
	}
}

void cc_handler(int signo) {
	if (signo == SIGINT && times>1) {
		times--;
		printf("\nControl-c caught. %d more before program is ended.\n", times);
	}else{
		printf("\nFinal Control-c caught. Exiting.\n");
		exit(1);
	}
}


int main(int argc, char *argv[]) {

	printf("Date will be printed every 3 seconds.\n");
	printf("Enter ^C 5 times to end the program:\n");

	struct sigaction sig_alarm;
	memset(&sig_alarm, 0, sizeof(sig_alarm));
	sig_alarm.sa_handler = handler;

	if(sigaction(SIGALRM, &sig_alarm, NULL)){
		perror("Handler problem");
		exit(1);}

	struct sigaction sig_cc;
	memset(&sig_cc, 0, sizeof(sig_cc));
	sig_cc.sa_handler = cc_handler;

	if(sigaction(SIGINT, &sig_cc, NULL)){
		perror("Handler problem");
		exit(1);
	}

	alarm(3);
	while (1){
	} ; 
}
