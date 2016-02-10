#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <signal.h>
#include <unistd.h>

void sig_handler_int(int signo) {
	if (signo == SIGINT) {
		printf("Got an int!\n");
	}
}

void sig_handler_alrm(int signo) {
	if (signo == SIGALRM) {
		printf("Got an alarm!\n");
		alarm(1);
	}
}

int main(int argc, char *argv[]) {

	printf("Installing a signal hander\n");

	struct sigaction act;
	memset(&act, 0, sizeof(act));
	act.sa_handler = sig_handler_int;

	if (sigaction(SIGINT, &act, NULL)) {
		perror("Failed to install the alarm handler");
		exit(1);
	}	

	struct sigaction act2;
	memset(&act2, 0, sizeof(act2));
	act2.sa_handler = sig_handler_alrm;

	if (sigaction(SIGALRM, &act2, NULL)) {
		perror("Failed to install the alarm handler");
		exit(1);
	}

	alarm(1);

	while (1) ; // spin
}