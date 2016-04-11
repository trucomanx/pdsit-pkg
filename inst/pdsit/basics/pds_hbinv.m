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

function P = pds_hbinv(H)
%
%  The function return the inverse of pds_hb(), the inverse P probability of 
%  binary entropy H.
%
%  P = pds_hbinv(H)
%
%  $H=h_b(P)= -P~log_2(P)-(1-P) log_2(1-P)$
%  $P = h_b^{-1}(H),~0\leq P\leq 0.5$
%
%  Input:
%    H  is the binary entropy of P, this can be a value vector or matrix.
%
%  Output:
%    P  is a probability. If H is a matrix o vector, the inverse of binary entropy
%       is calculated element by element.
%
%  Code developer: Fernando Pujaico Rivera <fernando.pujaico.rivera@gmail.com>
%
%  For help, bug reports and feature suggestions, please visit:
%  http://trucomanx.github.io/pdsit-pkg/
%
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

		while (abs(pds_hb(P)-H)/H)>(0.01/100)	

			if pds_hb(P)>H
				P_MAX=P;
			else
				P_MIN=P;
			end

			P=(P_MIN+P_MAX)/2.0;	

		end
	end
end
