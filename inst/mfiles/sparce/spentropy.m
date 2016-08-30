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

function [H M varargout]=spentropy(P,varargin)
%  This function returns the joint entropy of the joint probability mass function, 
%  between a set of N discretes random variables with N signals x_i, 
%  for all 1<= i <=N.
%  The function uses as input parameter a sparce matrix.
%  The function uses the data returned by experimental joint probability function,
%  see 'help experimental_joint_prob'. 
%
%  H          = spentropy(P);
%  [H M]      = spentropy(P);
%  %% Additional parameter
%  [H M Hmax] = spentropy(P,CONF);
%  
%  Input:
%   P    is a sparse matrix with the joint probabilities of the N signals x_i.
%   CONF [Optional] is a structure with the configuration data of sparse matrix P.
%        CONF.MIN : It is a vector with the minimum values of each x_i signal.
%                   The length of vector is N.
%        CONF.M   : It is a vector with the dimensions of matrix P, the length
%                   of vector is N.
%        This data only is used to calculates the Hmax output parameter.
%
%  Output:
%   H    is the joint entropy H(x_1,x_2,x_3,...,x_N).
%   M    is the the number of elements non zero probabilities in the sparse 
%        matrix P (This data is only a curiosity of input parameter P).
%   Hmax [Optional] is the maximum entropy acording the CONF structure. 
%        Hmax=log2(prod(CONF.M))
%
%  For help, bug reports and feature suggestions, please visit:
%  http://trucomanx.github.io/pdsit-pkg/
%

%  Code developer: Fernando Pujaico Rivera <fernando.pujaico.rivera@gmail.com>

	if( (nargin==1) && (nargout>2) )
		error('The third output parameter is only enabled when exist a second input parameter.');
	end

	if( issparse(P)==0 )
		error('The input parameter is not a sparse matrix.');
	end

	Q=nonzeros(P);

	if( abs(sum(Q)-1.0)>10*eps )
		error('The sum of probabilities is different of 1.0.');
	end

	M=length(Q);

	H=-sum(Q.*log2(Q));

	if( (nargin>1) && (nargout>2) )
		varargout{1}=log2(prod(varargin{1}.M));
	end

end
