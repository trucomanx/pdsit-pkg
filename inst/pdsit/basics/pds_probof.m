function pr=pds_probof(P,CONF,V)

	V=round(V);
	pr=0;

	V=V-CONF.MIN+1;

	if length(find(V<1))==0
	
		ID=vec2ind(CONF.M,V);

		pr=nonzeros(P(ID,1));
		if length(pr)==0
			pr=0;
		end
	end
end
