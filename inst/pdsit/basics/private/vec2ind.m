%% return the equivalent value index idt to vector index (id1,id2,id3,...).
function id=vec2ind(SIZE,VECTOR)

	n=length(SIZE);

	id=(VECTOR(1)-1);
	for II=2:n

		f=1;
		for JJ=1:(II-1)
			f=f*SIZE(JJ);
		end

		id=id+(VECTOR(II)-1)*f;
	end

	id=id+1;
end
