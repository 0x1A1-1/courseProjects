1. Given a string, find the longest palindromic subsequence.

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

2. You are planning out your schedule for the next n days. On day i, you can visit your aunt to get Ci candies. But
if you do so, you cannot visit her for another Di days. Determine the maximum number of candies you can get
from your aunt.


3. Consider a two-player game where you and your friend start with a list of numbers. The game proceeds in turns,
and each person during their turn takes either the first or the last number from the list. When the list is empty,
the person with the largest sum of numbers taken wins. Determine whether you can win, assuming your friend
plays optimally.


4. Roads in the city of Winterville are organized as a tree. Every snowy morning a snow plow goes around clearing
roads in the city with the goal of clearing as many intersections as possible. It starts from a depot at the root of
the tree and returns to the depot at the end of the day. When the roads are really bad, the snow plow cannot clear
all intersections during the day. Determine what route it should take to clear as many as possible by a certain
deadline. Assume that you are given the precise integral amount of time it will take the plow to go over each
road
