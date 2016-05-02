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


function [P CONF]= exp_joint_prob(X,T='lines')
%
%  The function returns the experimental joint probability between a set of Nvars
%  signals x_i, for all 1<= i <=Nvars, before begin the calculus is applied
%  internally the round(X) function over X.
%  
%  The function uses as input a matrix X formed by the sample vectors X_i of 
%  signals x_i. If T='lines', then X= [X_1; X_2; X_3; ...]. By other side if 
%  T='columns' then the samples of x_i are located in the columns of X matrix.
% 
%  P = exp_joint_prob(X);             % Joint probability of the lines of matrix X.
%  P = exp_joint_prob(X,T);           % T can be equal to 'lines' or 'columns'.
%  [P CONF] = exp_joint_prob(X);      % Additionally return configuration data.
%  [P CONF] = exp_joint_prob(X,T);    % T can be equal to 'lines' or 'columns'.
%  
%
%  Input:
%   X    is a matrix with the samples of signals x_i.
%   T    is an indicator, this shows if the samples of x_i are in the lines 
%        (T='lines') or in the columns (T='columns') of X.
%
%  Output:
%   P    is a sparse matrix with the joint probabilities of the Nvars signals x_i.
%        For get the probabilities without the position you can use:   nonzero(P)
%        For get the probabilities to a specific n-tuple (x_1=a, x_2=b, x_3=c, ..)
%        you can use the function  'scv2prob()', see the example bellow.
%   CONF is a structure with the configuration data of sparse matrix P.
%        CONF.MIN : It is a vector with the minimum values of each x_i signal.
%                   The length of vector is Nvars.
%        CONF.M   : It is a vector with the dimensions of matrix P, the length
%                   of vector is Nvars.
%
%
%  EXAMPLE: 
%  If we analyze the sample vectors X_1, X_2 and X_3 of signals x_1, x_2 and x_3 
%  respectively. Then, the experimental joint probability P, between them,
%  can be calculated as.
%
%  X = [ X_1; X_2; X_3];
%  [P CONF]= exp_joint_prob(X);
%
%  Thus, the sparse matrix P represent a 3D matrix. So that the probability of 
%  Pr(x_1=a,x_2=b,x_3=c) is equal to prob:
% 
%  prob=scv2prob(P,CONF,[a,b,c]);
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



