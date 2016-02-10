/* Xiaojun He	Section 1
 * Partner: Nick Stilin Section 1
 * Takes an binary file and reads integers from it into a linked list.
 * Compares that list with user input who tries to guess what
 * integers are in the list.
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>

/*construct a linked list name Node, which has value
 * and a pointer to next node*/
typedef struct Node{
	int val;
	struct Node *next;
}Node;

/*declare all the functions*/
Node * createlist(int fd);
Node * listadd(Node *head, int intforlist);
void printlist(Node *head);
void playgame(Node * listhead);
int inlist(Node *head, int intvalue);

/* creatList
 *
 * -parameters: 
 * 	fd: file descriptor
 * -return the head of the new list
 *
 * read integers from binary file and store them into
 * linked list. Use the linked list to play the guessing
 * game , return NULL if error has occured*/
Node * createlist(int fd){
	Node *head=NULL;
	struct stat buf; //buffer store the content of fstat	
	if(fstat(fd, &buf)==-1)
	{
		printf("cannot get stats from file\n");
		return NULL;
	}
	int size=buf.st_size; //store size of file
	int intin=0;	
	for (int i=0; i<size/sizeof(int) ;i++)
	{
		if      (read(fd, &intin, sizeof(int))==-1)
		{
			printf("file cannot be read\n");
			return NULL;
		}
		else{
			head=listadd(head, intin);
		}
	}
	if (head==NULL){
		return NULL;
	}
	return head;
	}

/*listadd
 *
 * -parameter: 
 *  	head: the head points to linked list
 *	intforlist: the integer to be added
 * -return:
 *  	the new head of the list
 *
 * add new nodes to the linked list*/	
Node * listadd(Node *head, int intforlist){
		Node *newhead=malloc(sizeof(Node));
		newhead -> val=intforlist;
		newhead -> next=head;
		return newhead;
	}
/* printlist
 *
 * -parameter:
 *  	*head: the head of the list
 *
 * print all the integers in the linked list*/
void printlist(Node *head){
	while (head!=NULL){
		printf("%d\n", head -> val);
		head=head -> next;}
}

/* playgame
 *
 * -parameter:
 *  	listhead: the head of the linked list
 *
 * Handles I/O messages and prompts, controls the flow of the game and
 * handles errors. Checks input vs items in the list of nodes.
 */
void playgame(Node * listhead){

	char * userinput=malloc(100);// allocate memory for userinput

	printf("This game has you guess which integers are in the list\n");
	printf("Enter an integer (followed by the newline)\n");
	printf("or q (Followed by the newline) to quit\n");
	printf("Integer guess: ");
	if (fgets(userinput, 100, stdin)==NULL){
		printf("An error has occured");
		exit(1);
	}

	while (strcmp(userinput,"q\n")!=0){
		if (inlist(listhead, atoi(userinput))==1){
			printf("%d is in the list\n",atoi(userinput));}
		else {
			printf("%d is not in the list\n",atoi(userinput));
		}
		printf("Integer guess: ");
		if (fgets(userinput, 100, stdin)==NULL){
			printf("An error has occured");
			exit(1);
		}	
	}
	printf("Quitting\n");

}

/* inlist
 *
 * -parameter:
 *   *head: the head of the linked list
 *   intvalue: the value to be tested
 *
 * -return:
 *   1 if value is in the list, 0 if not
 *
 * Iterates through list to find user input value, returns 1 and sets curr
 * if item is in list or 0 if it is not.
 */
int inlist(Node *head, int intvalue){
	Node * curr=head; //get a new head
	while(curr!=NULL){
		if(curr->val==intvalue)
		{ return 1;}
		curr =curr->next; 
	}
	return 0; 
}

/* main class
 * -parameter:
 *   argc: counts of arguments.
 *   argv[]: array of arguments.
 * -return:
 *   return 0 if program runs successfully.
 *
 * Handles errors and file accesses and primary node and file addressing.
 */
int main (int argc, char *argv[]){
	char * file;  //string to hold file's name
	int fd;		//file descriptor
	Node *head;   //head pointer     

	if (argc != 2) {
		printf("Illegal arguments\n");
		exit(1);
	}

	file=argv[1];
	fd=open(file, O_RDONLY);

	if (fd==-1){
		printf("File cannot be open\n");
		exit(1);
	}

	head=createlist(fd);
	playgame(head);	

	if (close(fd)==-1){
		fprintf(stderr, "error closing file -- quitting\n");
		exit(1);
	}
	return 0;
}	
