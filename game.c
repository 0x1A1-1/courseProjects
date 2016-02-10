#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

typedef struct Node{
	int val;
	struct Node *next;
}Node;

Node * createlist(int fd);
Node ** listadd(Node **head, int intforlist);
void printlist(Node *head);

Node * createlist(int fd){
	Node * head=NULL;
	Node ** nodePntr = &head;
	struct stat buf;	
	if(fstat(fd, &buf)==-1)
	{
		printf("cannot get stats from file\n");
		return NULL;
	}
	int size=buf.st_size;
	int * intin=(int *)malloc(size);
	if (intin==NULL){
		printf("cannot allocate memory\n");
		return NULL;
	}

	for (int i=0; i<size/sizeof(int) ;i++)
	{
		if      (read(fd, intin, sizeof(int))==-1)
		{
			printf("file cannot be read\n");
			return NULL;
		}
		else{
			nodePntr =listadd(nodePntr, *intin);
		}
	}
	if (head==NULL){
		return NULL;}
	return head;
}

Node ** listadd(Node **head, int intforlist){
	Node *newhead=(Node*)malloc(sizeof(Node));
	newhead -> val=intforlist;
	newhead -> next= NULL;
	*head = newhead;
	return &(newhead->next);
}

void printlist(Node *head){
	while (head!=NULL){
		printf("%d\n", head -> val);
		head=head -> next;}
}

int main (int argc, char *argv[]){
	char *file;
	int fd;
	Node *head;        

	if (argc != 2) {
		printf("Illegal arguments\n");
		exit(1);
	}

	file=argv[1];
	fd=open(file, O_RDONLY);
	if (fd==-1)
	{
		printf("file cannot be open\n");
		exit(1);
	}

	head=createlist(fd);
	printlist(head);
	return 0;
}
