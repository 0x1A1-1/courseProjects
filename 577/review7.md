For DP: Need:
1. Can extract answer
2. Computable
3. Efficiency


**1**. Given a string, find the longest palindromic subsequence.

OPT[i,j]: length of longest palindrome within interval from i to j
OPT[i,i]=1;
OPT[i,j]= max(  OPT[i+1,j-1] +2 if (a[i]=a[j]),
		OPT[i+1,j],
		OPT[i,j-1])
	Table of [i,j] to check??	
Proof of correctness:
Claim: The recurrence correctly computes the length of the longest palindromic subsequence
	Basecase: For length of 0 or 1, the answer is 0 or 1;
 Assume claim valid for all k <= l 
 In the table, all cases of i=j can be set as 1, for the element to the upper right to it, they depend strictly on
 the term that is smaller than it

**2**. You are planning out your schedule for the next n days. On day i, you can visit your aunt to get Ci candies. But
if you do so, you cannot visit her for another Di days. Determine the maximum number of candies you can get
from your aunt.


**3**. Consider a two-player game where you and your friend start with a list of numbers. The game proceeds in turns,
and each person during their turn takes either the first or the last number from the list. When the list is empty,
the person with the largest sum of numbers taken wins. Determine whether you can win, assuming your friend
plays optimally.

Take in a list of number, predict if I could win if I play optimally
1. Greedy stratgy, pick the biggest you could everytime
	For the case *1,4,10,3*, choosing the biggest will expose the large number to your opponent!!!!!!!! NOOOO
2. Dynamic Programming: OPT[i,j]= max ( i + OPT[i+1,j]	, j + OPT[i,j-1] ) *but the OPT in the substep is gonna be taken
	by our good friend :( *
	So ->  OPT[i,j]= max ( i + (TOTAL[i+1,j]-OPT[i+1,j])  , j + (TOTAL[i,j-1]-OPT[i,j-1])  ) 
Proof of correctness:
Claim: Both recurrences computes best possible score for both players
Proof by induction:
		

**4**. Roads in the city of Winterville are organized as a tree. Every snowy morning a snow plow goes around clearing
roads in the city with the goal of clearing as many intersections as possible. It starts from a depot at the root of
the tree and returns to the depot at the end of the day. When the roads are really bad, the snow plow cannot clear
all intersections during the day. Determine what route it should take to clear as many as possible by a certain
deadline. Assume that you are given the precise integral amount of time it will take the plow to go over each
road

**Cases of pseudo polynomial and strongly polynomial both exist**
First of, assume tree is binary...

Pseudo: OPT[ u, k ] : Given root at u and time k, max # of intersections we can visit
    Overall : OPT[ r, x ]: root and total time x
	Base case: OPT[n,0]/ OPT[n,k] where k is not enough for anything = 1
	if time cost of right subtree is bigger than k , you have to go down left
	------> OPT[u,k]= 1 + OPT[ul, k-c1 ] if c2>k
	Another symmetric case, OPT[u,k] = 1 + OPT[ur, k-c2] if c1>k

Non-pseudo: OPT[u,k] mininum time to cover k vertices in subtree. If mininum time smaller than K ->yay
	if left is too big, then we just go down to right tree and find mininum tim to visit k-1 vertices


AND THE TA DOES SUCK :))))














