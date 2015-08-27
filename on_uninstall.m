function h=on_uninstall(desc)
% This code remove the paths of octave "path" of all directory of code.

	data={'basics','ceo','omega'};

	pfxpath=getfield(desc,'dir');
	
	for k=1:length(data)
		rmpath([pfxpath,filesep,'pdsit',filesep,data{k}]);
	end
	
end
