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


function IDL=vec2ind(DIMS,IDV)
%  Return the equivalent linear index IDL of vector index IDV=[id1,id2,id3,...],
%  both pointing to element A(id1,id2,id3,...) of matrix A of size DIMS.
%
%  IDL=vec2ind(DIMS,IDV)
%  IDL=vec2ind(size(matrix_a),vector_index);
%  
%  Input:
%   DIMS   is the dimension of matrix of vector index analized.
%   IDV    is the vector index to convert to linear index.
%
%  Output:
%   IDL    is the linear index equivalent to the vector_index IDV.
%          If any element of vector index is out of range, then the function 
%          return error.
%          If the lengths of DIMS and IDV are differents then the function 
%          return error.
% 
%  EXAMPLE:
%  The following example shows how to convert the 3-dimensional
%  index '(2,3,1)', of a matrix A, to a linear index. The matrix is
%  linearly indexed moving from one column to next, filling up all
%  rows in each column.
% 
%  vector_index = [2, 3, 1]
%  linear_index = vec2ind (size(A), vector_index)
%

	n=length(DIMS);
	nv=length(IDV);

	if (n~=nv)
		error('Index lengths out of range');
	end

	for II=1:n
		if DIMS(II)<IDV(II);
			error(sprintf('Index %d out of range',II));
		end
	end

	IDL=(IDV(1)-1);
	for II=2:n

		f=1;
		for JJ=1:(II-1)
			f=f*DIMS(JJ);
		end

		IDL=IDL+(IDV(II)-1)*f;
	end

	IDL=IDL+1;
end
