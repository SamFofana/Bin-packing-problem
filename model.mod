

/* The bin packing problem is aimed to pack I = {1,...,m}
elements of different volumes v[i] into bins each with a fixed capacity V
in a way that minimizes the number of bins used. */

  param m, integer, > 0;   /* number of elements to pack */
  set I := 1..m;           /* set of elements */
  param v{i in 1..m}, > 0; /* v[i] is volume of element i */
  param V, > 0;            /* bin capacity */

  /* worse scenario for the number of bins used */
  param n := m;


/* set of bins */
set J := 1..n;


/* x[i,j] = 1 means elemnt i is in bin j */
var x{i in I, j in J}, binary;


/* y[j] = 1 bin j is used */
var y{j in J}, binary;



/* each element of the set of elements must be contained in exactly one bin */
s.t. one{i in I}: sum{j in J} x[i,j] = 1;


/* the content of the bin must not exceed its capacity */
s.t. lim{j in J}: sum{i in I} v[i] * x[i,j] <= V * y[j];

/* the minimization of the number of bins used is the objective function of this problem */
minimize obj: sum{j in J} y[j];

  data;

param m := 10;

param v := 1 0.61, 2 0.96, 3 0.95, 4 0.91, 5 0.13, 6 0.53, 7 0.53, 8 0.05, 9 0.65, 10 0.66;

param V := 1;

end;


