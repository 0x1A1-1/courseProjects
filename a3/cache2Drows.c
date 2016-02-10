#include<stdio.h>
int arr2d[3000][500];
int main(){
	int i,j;
	for (i=0; i<3000; i++){
		for (j=0; j<500;j++){
			arr2d[i][j]=i+j;}}
	return 0;
}
