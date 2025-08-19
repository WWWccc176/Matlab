function [ theta, weight, x ] = glpairtabulated ( l, k )

%*****************************************************************************80
%
%% glpairtabulated() computes the K-th pair of an N-point Gauss-Legendre rule.
%
%  Discussion:
%
%    Data is tabulated for 1 <= L <= 100.
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
%    integer L, the number of points in the given rule.
%    1 <= L <= 100.
%
%    integer K, the index of the point to be returned.
%    1 <= K <= L.
%
%  Output:
%
%    real THETA, WEIGHT, X, the theta coordinate, weight, 
%    and x coordinate of the point.
%
  if ( l < 1 || 100 < l )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GLPAIRTABULATED - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of L.\n' );
    error ( 'GLPAIRTABULATED - Fatal error!' );
  end

  if ( k < 1 || l < k )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GLPAIRTABULATED - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of K.\n' );
    error ( 'GLPAIRTABULATED - Fatal error!' );
  end

  theta = legendre_theta ( l, k );
  weight = legendre_weight ( l, k );

  x = cos ( theta );   

  return
end


