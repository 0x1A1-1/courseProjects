/* Xiaojun He Section 1
 * Partner: Nick Stilin Section 1
 * Reads in integers from binary file.Computes average of the integers
 * and the number of integers.
 */
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <assert.h>
#include <unistd.h>

/* main class
 * -parameter:
 *   argc: counts of arguments.
 *   argv[]: array of arguments.
 * -return:
 *   return 0 if program runs successfully.
 * Reads in integers from binary file. Computes average of
 * the integers and number of integers.
 */
int main(int argc, char *argv[])
{
	char *file;	//string to hold file's name
	int fd;     	//file descriptor
	int numbytes;	//number of bytes of fie
	int *ptr;	//pointer hold the value of input int
	int numInts=0;	//number of integers in the file	
	int total=0;	//total sum of integers
	float avg;	//average of integers	
	struct stat buf;//buffer used to fstat

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
	if(fstat(fd, &buf)==-1)
	{
		printf("cannot get stats from file\n");
		exit(1);
	}

	numbytes=buf.st_size;
	ptr=malloc(numbytes);

	if(ptr==NULL)
	{printf("cannot allocate memory\n");
		exit(1);

	}

	numInts=numbytes/sizeof(int);

	for (int i=0; i<numInts;i++)
	{
		if	(read(fd, ptr, sizeof(int))==-1)
		{
			printf("file cannot be read\n");
			exit(1);

		}
		total+=*ptr;
		ptr+=sizeof(int);
	}

	avg=total/numInts; 
	printf("Number of intergers is %d, average is %f.\n", numInts, avg);

	if ( close(fd) == -1 ) {
		fprintf(stderr, "error closing file -- quitting\n");
		exit(1);
	}
	return 0;
}

