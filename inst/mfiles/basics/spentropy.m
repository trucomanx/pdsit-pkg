%  Copyright (C) 2016   Fernando Pujaico Rivera
%
%  This file is a part of the PDS Information Theory (PDSIT) package.
%
%  This PDSIT computer package is free software; you can redistribute it
%  and/or modify it under the terms of the GNU General Public License as
%  published by the Free Software Foundation; either version 2 of the
%  License, or (at your option) any later version. 
%
%  This PDSIT computer package is distributed in the hope that it will be
%  useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%  GNU General Public License for more details.
%
%  You should have received a copy of the GNU General Public License
%  along with this program; if not, please download it from
%  <http://www.gnu.org/licenses>.

function [H M]=spentropy(P)
%  This function return the joint probability of N signals x_i, for all 1<= i <=N.
%  The function use the data returned by experimental joint probability function,
%  see 'help exp_joint_prob'. 
%
%  H     = spentropy(P);
%  [H M] = spentropy(P);
%  
%  Input:
%   P    is a sparse matrix with the joint probabilities of the Nvars signals x_i.
%
%  Output:
%   PR   is the joint probabilities of Pr(x_1=a_1, x_2=a_2, x_3=a_3, ..., x_N=a_N).
%   IDL  is the linear index, in the sparse matrix P, correspondent to the 
%        vector V. If any element of vector V is out of range, then the function 
%        return IDL=-1 and PR=0.
%
%  EXAMPLE:
%  Given 4 signals x_1, x_2, x_3 and x_4, with a sparse joint probability 
%  matrix P and a structure CONF with the configuration data (obtained by 
%  exp_joint_prob() function), the value PR of joint probability
%  Pr(x_1=a_1, x_2=a_2, x_3=a_3, x_4=a_4) can be obtained as:
%  
%  [PR IDL] = scv2prob(P,CONF,[a_1 a_2 a_3 a_4]); 
%
%  Additionally the function return the linear index equivalent to vector index
%  [a_1 a_2 a_3 a_4].
%
%
%  For help, bug reports and feature suggestions, please visit:
%  http://trucomanx.github.io/pdsit-pkg/
%

%  Code developer: Fernando Pujaico Rivera <fernando.pujaico.rivera@gmail.com>

	if( issparse(P)==0 )
		error('The input parameter is not a sparse matrix.');
	end

	Q=nonzeros(P);

	if( abs(sum(Q)-1.0)>10*eps )
		error('The sum of probabilities is different of 1.0.');
	end

	M=length(Q);

	H=-sum(Q.*log2(Q));

end
