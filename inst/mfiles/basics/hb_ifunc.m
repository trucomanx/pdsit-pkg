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

function P = hb_ifunc(H)
%
%  The function return the inverse of hb_func(), the inverse P probability of 
%  binary entropy H.
%
%  P = hb_ifunc(H)
%
%  $H=h_b(P)= -P~log_2(P)-(1-P) log_2(1-P)$
%  $P = h_b^{-1}(H),~0\leq P\leq 0.5$
%
%  Input:
%    H  is the binary entropy of P, this can be a value vector or matrix.
%
%  Output:
%    P  is a probability. If H is a matrix o vector, the inverse of binary entropy
%       is calculated for element of H. so that $H_i=-P_i~log_2(P_i)-(1-P_i) log_2(1-P_i)$.
%       If the element $H_i$, of H, is greater than or equal to 1, then $P_i=0.5$.
%       If the element $H_i$, of H, is less than or equal to 0, then $P_i=0.0$.
%
%
%  For help, bug reports and feature suggestions, please visit:
%  http://trucomanx.github.io/pdsit-pkg/
%

%  Code developer: Fernando Pujaico Rivera <fernando.pujaico.rivera@gmail.com>

	P=arrayfun(@hbinvval,H);

end


function P = hbinvval (H)

	if H<=0

		P=0.0;

	elseif H>=1

		P=0.5;

	else
		P=0.25;

		P_MIN=0.0;
		P_MAX=0.5;

		while (abs(hb_func(P)-H)/H)>(0.01/100)	

			if hb_func(P)>H
				P_MAX=P;
			else
				P_MIN=P;
			end

			P=(P_MIN+P_MAX)/2.0;	

		end
	end
end
