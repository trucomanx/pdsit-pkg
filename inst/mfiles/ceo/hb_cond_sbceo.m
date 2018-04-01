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

function Hc = hb_cond_sbceo(Ps,M)
%
%  The function returns the binary conditional entropy H(U_0|U_1 U_2 ... U_M) in 
%  the symmetric binary CEO problem of M sources U_i creates from a common source U_0.
%
%  Hc = hb_cond_sbceo(Ps,M)
%
%  $ Hc = H(U_0|\Omega_M) = H(U_0|U_1 U_2 ... U_M) $
%
%  The function calculates the symmetric case when $Ps = Pr(U_i|U_0)$ and 
%  $Pr(U0=1)=0.5)$. At to end, the entropy Hc is calculated as:
%
%  $ Hc = \sum_{k=0}^M \binom{M}{k} Ps^k (1-Ps)^{M-k} log2( 1 + {Ps/(1-Ps)}^{M-2*k}) $
%
%  The last equation can be seen in [1] in page 49.
%
%  References:
%  [1] Heshmati, Ashkan   (2007) Data compression and transmission in   
%      Wireless Sensor Networks. Masters thesis, Concordia University. 
%      URL http://spectrum.library.concordia.ca/975271/ 
%
%  Input:
%   Ps  is the probability of BSC channels, Pr(Ui~=U0|U0)=Ps. Ps can be a value
%       or vector.
%   M   is the number of BSC channels in the CEO problem. M only can be a value.
%
%  Output:
%   Hc is the the conditional entropy of H(U0 |U1 U2 ... UM).
%
%  For help, bug reports and feature suggestions, please visit:
%  http://trucomanx.github.io/pdsit-pkg/
%

%  Code developer: Fernando Pujaico Rivera <fernando.pujaico.rivera@gmail.com>

	if(~isvector(Ps))
		error('Ps could be a value or vector.');
	end

	if(~isvector(M))
		error('M could be a value or vector.');
	end

    if iscolumn(Ps)
        Hc=zeros(length(Ps),length(M));
        for II=1:length(M)
            Hc(:,II) = hb_cond_sbceo_vec_val(Ps,M(II));
        end
    else
        Hc=zeros(length(M),length(Ps));
        for II=1:length(M)
            Hc(II,:) = hb_cond_sbceo_vec_val(Ps,M(II));
        end
    end
end

function Hc = hb_cond_sbceo_vec_val(Ps,M)
	if(~isvector(Ps))
		error('Ps should be a vector or value');
	end

	if(~isnumeric(M))
		error('M only can be a value.');
	end

	STEPS=length(Ps);
	Hc =zeros(1,STEPS);


	for II=1:STEPS
		Hc(1,II)=0;

		if( (Ps(1,II)>0)&&(Ps(1,II)<1.0) )
			for KK=0:M
				Hc(1,II)=Hc(1,II)+nchoosek(M,KK)*(Ps(1,II)^KK)*(1.0-Ps(1,II))^(M-KK)*log2(1+(Ps(1,II)/(1-Ps(1,II)))^(M-2*KK));
			end
		end
	end

end

