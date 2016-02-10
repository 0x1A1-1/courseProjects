#include <stdio.h>

int main()
{
    char letter;
    int a[10]={1,2,3,4,5,6,7,8,9,10};
    printf("%d\n",a[5]);
    a[10]=6;
    printf("The alphabet:\n");
    for (letter = 'a'; letter <= 'z'; letter++) {
        printf("%c", letter);
    }
    printf("\n");
}
