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

function [PR IDL]=get_probability(P,CONF,V)
%  This function return the joint probability of a vector that represent a state 
%  of a set of N signals x_i, for all 1<= i <=N. The probability will be search
%  in a sparce matrix P.
%  The function use the data returned by experimental joint probability function,
%  see 'help experimental_joint_prob'. 
%
%  PR       = get_probability(P,CONF,V);
%  [PR IDL] = get_probability(P,CONF,V);
%  [PR IDL] = get_probability(P,CONF,[a_1 a_2 a_3]); % PR=Pr(x_1=a_1, x_2=a_2, x_3=a_3) 
%  
%  Input:
%   P    is a sparse matrix with the joint probabilities of the N signals x_i.
%   CONF is a structure with the configuration data of sparse matrix P.
%        CONF.MIN : It is a vector with the minimum values of each x_i signal.
%                   The length of vector is N.
%        CONF.M   : It is a vector with the dimensions of matrix P, the length
%                   of vector is N.
%   V    is a vector of length N, V has the N-tuple (a_1, a_2, ..., a_N)
%        of (x_1, x_2, ..., x_N), which you want to get the probability
%        Pr(x_1=a_1, x_2=a_2, x_3=a_3, ..., x_N=a_N). 
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
%  experimental_joint_prob() function), the value PR of joint probability
%  Pr(x_1=a_1, x_2=a_2, x_3=a_3, x_4=a_4) can be obtained as:
%  
%  [PR IDL] = get_probability(P,CONF,[a_1 a_2 a_3 a_4]); 
%
%  Additionally the function return the linear index equivalent to vector index
%  [a_1 a_2 a_3 a_4].
%
%
%  For help, bug reports and feature suggestions, please visit:
%  http://trucomanx.github.io/pdsit-pkg/
%

%  Code developer: Fernando Pujaico Rivera <fernando.pujaico.rivera@gmail.com>

	V=round(V);
	PR=0;

	V=V-CONF.MIN+1;

	IDL=-1;

	if length(find(V<1 | V >CONF.M))==0
	
		IDL=vec2ind(CONF.M,V);

		PR=nonzeros(P(IDL,1));
		if length(PR)==0
			PR=0;
		end
	end
end
