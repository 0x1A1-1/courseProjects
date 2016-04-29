## Exam Wed 3/16 7:15p **Chamberlain 2103**

### Shortest Path

Define SPL(v,t) = Shortest Path length from v to t

	SPL(s,t)=min( d(s,v) + SPL(v,t) ) where d(s,v)=length of s->v edge

### New Definition
	
	SPL(s,k) = length of shortest path form s to t with at most k hops
	SPL(s,k) = min ( d(s,v) + SPL(v, k-1) ) 
	SPL(s,1) = min( d(s,t) ) for all s

Shortest Path Len(s,t) = SPL(s, n-1)

*Iterative Version
	For each v, set M[v,1] = d(v,t)
	For k=2 to n-1
		for each vertex v
			Set M[v,k] = min ( d(v,w) + M(w, k-1) )
Running Time:
	O(m) * (n-1) where m is number of directed edges
	= O(mn)

