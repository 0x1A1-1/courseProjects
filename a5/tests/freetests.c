#include <assert.h>
#include <stdlib.h>
#include "mem.h"
#include <stdio.h>

int main() {
   assert(Mem_Init(4096) == 0);
   void* ptr[2];

   ptr[0] = Mem_Alloc(4);
   Mem_Free(ptr[0]);
   if(Mem_Free(ptr[1])==-1 || Mem_Free(NULL)==-1)
   printf("unable to free the block by provided pointer\n");
   exit(0);
}