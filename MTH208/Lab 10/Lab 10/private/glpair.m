function [ theta, weight, x ] = glpair ( n, k )

%*****************************************************************************80
%
%% glpair() computes the K-th pair of an N-point Gauss-Legendre rule.
%
%  Discussion:
%
%    If N <= 100, GLPAIRTABULATED is called, otherwise GLPAIR is called.
%
%    Theta values of the zeros are in [0,pi], and monotonically increasing. 
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 January 2016
%
%  Author:
%
%    Original C++ version by Ignace Bogaert.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Ignace Bogaert,
%    Iteration-free computation of Gauss-Legendre quadrature nodes and weights,
%    SIAM Journal on Scientific Computing,
%    Volume 36, Number 3, 2014, pages A1008-1026.
%
%  Input:
%
%    integer N, the number of points in the given rule.
%    0 < N.
%
%    integer K, the index of the point to be returned.
%    1 <= K <= N.
%
%  Output:
%
%    real THETA, WEIGHT, X, the theta coordinate, weight, 
%    and x coordinate of the point.
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GLPAIR - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of N.\n' );
    error ( 'GLPAIR - Fatal error!' );
  end

  if ( k < 1 || n < k )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GLPAIR - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of K.\n' );
    error ( 'GLPAIR - Fatal error!' );
  end

  if ( n < 101 )
    [ theta, weight, x ] = glpairtabulated ( n, k );
  else 
    [ theta, weight, x ] = glpairs ( n, k );
  end

  return
end

