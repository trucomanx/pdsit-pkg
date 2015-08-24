function H = pds_shu0omega(Ps,M)
%
% H = pds_shu0omega(Ps,M)
%
% The function return the conditional entropy H in the binary symmetric CEO 
% problem.
%
% $$
% H = H(U_0|\Omega_M) = H(U_0|U_1 U_2 ... U_M)
% $$
%
% The function calculates the symmetric case when $Ps = Pr(U_i|U_0)$ and 
% $Pr(U0=1)=0.5)$. At to end the entropy H is calculated as:
% $$
% H = \sum_{k=0}^M \binom{M}{k} Ps^k (1-Ps)^{M-k} log2( 1 +  {Ps/(1-Ps)}^{M-2*k}   )
% $$
%
% The last equation can be seen in [1] in page 49.
%
% References:
% [1] Heshmati, Ashkan   (2007) Data compression and transmission in   
%     Wireless Sensor Networks. Masters thesis, Concordia University. 
%     URL http://spectrum.library.concordia.ca/975271/ 
%
% Input:
%  Ps  is the probability of BSC channels, Pr(Ui~=U0|U0)=Ps. Ps can be a value
%      or vector.
%  M   is the number of BSC channels in the CEO problem. M only can be a value.
%
% Output:
%  H  is the the conditional entropy of H(U0 |U1 U2 ... UM).
%
% Code developer: Fernando Pujaico Rivera <fernando.pujaico.rivera@gmail.com>

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
%
%  For help, bug reports and feature suggestions, please visit:
%  http://trucomanx.github.io/pdsit-pkg
%
	if(~isvector(Ps))
		error('Ps should be a vector or value');
	end

	STEPS=length(Ps);
	H =zeros(1,STEPS);


	for II=1:STEPS
		H(1,II)=0;

		if(Ps(1,II)>0)
			for KK=0:M
				H(1,II)=H(1,II)+nchoosek(M,KK)*(Ps(1,II)^KK)*(1.0-Ps(1,II))^(M-KK)*log2(1+(Ps(1,II)/(1-Ps(1,II)))^(M-2*KK));
			end
		end
	end

end

