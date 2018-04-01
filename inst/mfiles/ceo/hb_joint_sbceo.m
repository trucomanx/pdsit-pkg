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

function Hj=hb_joint_sbceo(Ps,M)
%
%  The function returns the joint binary entropy H(U_1 U_2 ... U_M) in the 
%  symmetric binary CEO problem of M sources U_i creates from a common source U_0.
%
%  Hj=hb_joint_sbceo(Ps,M)
%
%  $ Hj = H(\Omega_M) = H(U_1 U_2 ... U_M) $
%
%  The function calculates the symmetric case when $Ps = Pr(U_i|U_0)$ and 
%  $Pr(U0=1)=0.5)$. At to end, the entropy Hj is calculated as:
%
%  $ Hj = -\sum_{k=0}^M \binom{M}{k} Prob(k)log_2( Prob(k) ) $
%
%  $ Prob(k)=0.5 ( Ps^k (1-Ps)^{M-k} + Ps^{M-k} (1-Ps)^k ) $
%
%  The last equation can be seen in [1].
%
%  References:
%  [1]  Ferrari, G.; Martalo, M.; Abrardo, A.; Raheli, R., "Orthogonal multiple 
%       access and information fusion: How many observations are needed?," 
%       Information Theory and Applications Workshop (ITA), 2012 , vol., no., 
%       pp.311,320, 5-10 Feb. 2012. doi: 10.1109/ITA.2012.6181783
%
%  Input:
%   Ps  is the probability of BSC channels, Pr(Ui~=U0|U0)=Ps. Ps can be a value
%       or vector.
%   M   is the number of BSC channels in the CEO problem. M only can be a value.
%
%  Output:
%   Hj is the the joint entropy H(U1 U2 ... UM).
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
        Hj=zeros(length(Ps),length(M));
        for II=1:length(M)
            Hj(:,II) = hb_joint_sbceo_vec_val(Ps,M(II));
        end
    else
        Hj=zeros(length(M),length(Ps));
        for II=1:length(M)
            Hj(II,:) = hb_joint_sbceo_vec_val(Ps,M(II));
        end
    end
end

function Hj=hb_joint_sbceo_vec_val(Ps,M)
	if(~isvector(Ps))
		error('Ps should be a vector or value');
	end

	if(~isnumeric(M))
		error('M only can be a value.');
	end

	Hj=zeros(size(Ps));

	for K=0:M
	
		ProbK=0.5*( (Ps.^K).*(1-Ps).^(M-K) + ((1-Ps).^(K)).*Ps.^(M-K) );
	
		ID=find( ProbK > 0 );

		Hj(ID)=Hj(ID)-nchoosek(M,K)*ProbK(ID).*log2(ProbK(ID));
	end

end

