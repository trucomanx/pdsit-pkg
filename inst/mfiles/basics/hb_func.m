%  Copyright (C) 2015, 2016   Fernando Pujaico Rivera
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


function H = hb_func(P)
%
%  The function return H, the binary entropy of P probability.
% 
%  H = hb_func(P)
% 
%  $H= -P~log_2(P)-(1-P) log_2(1-P)$
%  
%
%  Input:
%    P  is a probability, this can be a value, vector or matrix.
%
%  Output:
%   H   is the binary entropy of P. If P is a matrix o vector, the binary entropy
%       is calculated for each element of P, so that $H_i=-P_i~log_2(P_i)-(1-P_i) log_2(1-P_i)$.
%       If the element $P_i$, of P, is greater than or equal to 1, then $H_i=0.0$.
%       If the element $P_i$, of P, is less than or equal to 0, then $H_i=0.0$.
%
%
%  For help, bug reports and feature suggestions, please visit:
%  http://trucomanx.github.io/pdsit-pkg/
%

%  Code developer: Fernando Pujaico Rivera <fernando.pujaico.rivera@gmail.com>
	H=zeros(size(P));

	% Only evaluate  values P!=0
	ID=find( (P > 0) & (P < 1.0) );
	H(ID)=-P(ID).*log2(P(ID))-(1-P(ID)).*log2(1-P(ID));

end

