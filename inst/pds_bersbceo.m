function BER = pds_bersbceo(Ps,M)
%
% BER = pds_bersbceo(Ps,M)
%
% BER in symetric binary CEO problem.
%
% This function calculates the Bit Error Rate of decoding the source
% U0 (with probability $Pr(U0=1)=0.5)$ in the binary CEO problem for
% the case of $Pr(Ui \neq U0 | U0)=Ps$ (Symmetric case).
%
% BER is the Bit Error Rate of decode U0 known U1 U2 ... UM.
%
% ODD:
% $$
% BER=  \sum_{j=(M+1)/2}^{M} \binom{M}{j}   {Ps}^j     (1-Ps)^{M-j}
% $$
%
% EVEN:
% $$
% BER=  \sum_{j=(M/2)+1}^{M} \binom{M}{j}   {Ps}^j     (1-Ps)^{M-j}
%                       +0.5 \binom{M}{M/2} {Ps}^{M/2} (1-Ps)^{M/2}
% $$
%
% The formula for calculus of BER is in [1] and other simplification in [2,3].
%
% [1]  Haghighat, J.; Behroozi, Hamid; Plant, D.V., "Iterative joint decoding 
%      for sensor networks with binary CEO model," Signal Processing Advances 
%      in Wireless Communications, 2008. SPAWC 2008. IEEE 9th Workshop on , 
%      vol., no., pp.41,45, 6-9 July 2008. doi: 10.1109/SPAWC.2008.4641566
%
% [2]  Abrardo, A.; Ferrari, G.; Martalò, M.; Perna, F. Feedback Power Control 
%      Strategies in Wireless Sensor Networks with Joint Channel Decoding. 
%      Sensors 2009, 9, 8776-8809. doi:10.3390/s91108776
%
% [3]  Ferrari, G.; Martalo, M.; Abrardo, A.; Raheli, R., "Orthogonal multiple 
%      access and information fusion: How many observations are needed?," 
%      Information Theory and Applications Workshop (ITA), 2012 , vol., no., 
%      pp.311,320, 5-10 Feb. 2012. doi: 10.1109/ITA.2012.6181783
%
%
% Input:
%  Ps  is the probability of BSC channels, Pr(Ui~=U0|U0)=Ps. Ps can be a value
%      or vector.
%  M   is the number of BSC channels in the CEO problem. M only can be a value.
%
% Output:
%  BER is the Bit Error Rate of decode U0 known U1 U2 ... UM.
%
% Code developer: Fernando Pujaico Rivera <fernando.pujaico.rivera@gmail.com>
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
%
%  For help, bug reports and feature suggestions, please visit:
%  http://trucomanx.github.io/pdsit-pkg
%

	if(~isvector(Ps))
		error('Ps could be a value or vector.');
	end

	if(~isnumeric(M))
		error('M only can be a value.');
	end

	STEPS=length(Ps);
	BER =zeros(size(Ps));

	if((M/2)>fix(M/2))
		%IMP='impar'
		for II=1:STEPS
			BER(II)=0;
			for JJ=round((M+1)/2):M
				BER(II)=BER(II)+nchoosek(M,JJ)*(Ps(1,II)^JJ)*(1.0-Ps(1,II))^(M-JJ);
			end
		end
	else
		%PaR='par'
		for II=1:STEPS
			BER(II)=0;
			for JJ=round(M/2+1):M
				BER(II)=BER(II)+nchoosek(M,JJ)*(Ps(1,II)^JJ)*(1.0-Ps(1,II))^(M-JJ);
			end
			BER(II)=BER(II)+0.5*nchoosek(M,M/2)*(Ps(1,II)^(M/2))*(1.0-Ps(1,II))^(M/2);
		end
	end

end

