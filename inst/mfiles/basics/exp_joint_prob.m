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


function [P CONF]= exp_joint_prob(X,T='lines',varargin)
%
%  The function returns the experimental joint probability between a set of N
%  signals x_i, for all 1<= i <=N, before begin the calculus is applied
%  internally the round(X) function over X.
%  
%  The function uses as input a matrix X formed by the sample vectors X_i of 
%  signals x_i. If T='lines', then X= [X_1; X_2; X_3; ...]. By other side if 
%  T='columns' then the samples of x_i are located in the columns of X matrix.
% 
%  P = exp_joint_prob(X);              % Joint probability between the lines of matrix X.
%  P = exp_joint_prob(X,T);            % T can be equal to 'lines' or 'columns'.
%  P = exp_joint_prob(X,T,CONF);       % Specify the minimum and the dimension of the signals.
%  [P CONF] = exp_joint_prob(X);       % Additionally return configuration data.
%  [P CONF] = exp_joint_prob(X,T);     % T can be equal to 'lines' or 'columns'.
%  [P CONF] = exp_joint_prob(X,T,CONF);% The CONF in the output is equal to CONF in the input.
%  
%
%  Input:
%   X    is a matrix with the samples of signals x_i.
%   T    is an indicator, this shows if the samples of x_i are in the lines 
%        (T='lines') or in the columns (T='columns') of X.
%   CONF [Optional] is a structure that set the configuration data of 
%        sparse matrix P.  
%        CONF.MIN : It is a vector with the minimum values of x_i, samples in X
%                   with any element bellow this minimum cause an error. 
%                   The length of vector is N.
%        CONF.M   : It is a vector with the scale dimension of each signal x_i, 
%                   The maximum analyzed values will be MAX=CONF.MIN+CONF.M-1, 
%                   samples in X with any element above your maximum value cause 
%                   an error. the length of CONF.M vector is N.
%        If this structure is not used, then CONF.MIN is formed with the minimum 
%        values by signal in X, and CONF.M is calculated using the maximum values  
%        MAX of signals, so that CONF.M=MAX-CONF.MIN+1.
%
%  Output:
%   P    is a sparse matrix with the joint probabilities of the N signals x_i.
%        For get the probabilities without the position you can use:   nonzero(P)
%        For get the probabilities to a specific n-tuple (x_1=a, x_2=b, x_3=c, ..)
%        you can use the function  'scv2prob()', see the example bellow.
%   CONF is a structure with the configuration data of sparse matrix P.
%        CONF.MIN : It is a vector with the minimum values of each x_i signal.
%                   The length of vector is N.
%        CONF.M   : It is a vector with the dimensions of matrix P, the length
%                   of vector is N.
%        If CONF also is an input parameter, then both structures are equals. 
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

	N = size(X,1);
	Lsamples = size(X,2);

	if nargin >=3
		if( isstruct(varargin{1})==0 )
			error('The third argument is not a structure!');
		end
		if( isfield (varargin{1}.MIN, "name")==0 )
			error('The MIN field not exist!');
		end

		if( isfield (varargin{1}.M, "name")==0 )
			error('The M field not exist!');
		end

		if( N~=length(varargin{1}.MIN) || N~=length(varargin{1}.MIN) )
			error('The number of elements of fields M and MIN should be equal to the number of signals!');
		end
		CONF=varargin{1};
	else
		% Calculating the size M of matrix P when no sparce.
		CONF.MIN=min(X');
		CONF.M=max(X')-CONF.MIN+1;
	end

	ID=zeros(Lsamples,1);
	ONES=ones(Lsamples,1);

	%%% Transform X for only posssitive values > 0.
	X=X-CONF.MIN'+1;

	%%% creando P histograma multidimensional.
	for II=1:Lsamples
		ID(II)=vec2ind(CONF.M,X(:,II)');		
	end
	P=sparse(ID,ONES,ONES);

	%%% encontrado la probabilidad.
	P=P/Lsamples;
end



