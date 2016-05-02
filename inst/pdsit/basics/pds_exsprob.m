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


function [P CONF]= pds_exsprob(X,T='lines')
%
%  The function returns the experimental joint probability between the functions 
%  $x_i$ inside of matrix X.
% 
%  P = pds_exprob(X);				% 
%  P = pds_exprob(X,T);				% T can be equal to 'lines' or 'columns'.
%  [P CONF] = pds_exprob(X);			% 
%  [P CONF] = pds_exprob(X,T);		% T can be equal to 'lines' or 'columns'.
%  
%
%  Input:
%   X   is a probability, this can be a value, vector or matrix.
%   T   is 
%
%  Output:
%   P   is 
%
%
%  EXAMPLE: 
%  If I analize the vectors X_1, X_2 and X_3 of functions x_1, x_2 and x_3 
%  respectively. Then the experimental joint probability P, between them,
%  can be calculated as.
%
%  X = [ x_1; x_2; x_3];
%  [P conf]= pds_exsprob(X);
%
%  Thus, P is a 3D sparce matrix. So that the probability of Pr(x_1=a,x_2=b,x_3=c)
%  is equal to prb:
% 
%  prb=pds_probof(P,conf,[a,b,c]);
%
%  For help, bug reports and feature suggestions, please visit:
%  http://trucomanx.github.io/pdsit-pkg/
%


%  Code developer: Fernando Pujaico Rivera <fernando.pujaico.rivera@gmail.com>

	if (length(size(X))>2)
		error('The first input value should be a 2-D matrix!');
	end

	if ~(1==strcmp(T,'lines') || 1==strcmp(T,'columns'))
		error('The second input value should be the strings lines or columns.');
	end

	X=round(X);

	if (1==strcmp(T,'columns'))
		X=X';
	end

	Nvars = size(X,1);
	Nsamples = size(X,2);

	% Calculating the size M of matrix P when no sparce.
	CONF.MIN=min(X');
	CONF.M=max(X')-CONF.MIN+1;


	ID=zeros(Nsamples,1);
	ONES=ones(Nsamples,1);

	%%% Transform X for only posssitive values > 0.
	X=X-CONF.MIN'+1;

	%%% creando P histograma multidimensional.
	for II=1:Nsamples
		ID(II)=vec2ind(CONF.M,X(:,II)');		
	end
	P=sparse(ID,ONES,ONES);

	%%% encontrado la probabilidad.
	P=P/Nsamples;
end



