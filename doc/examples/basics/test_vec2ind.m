disp('Testando dentro del rango 2D');
id1=sub2ind([3 3], 1, 2)
id2=vec2ind([3 3], [1 2])

disp('Testando dentro del rango 3D');
id1=sub2ind([3 3 4], 1, 2, 4)
id2=vec2ind([3 3 4], [1 2 4])


disp('Testando dentro del rango 4D');
id1=sub2ind([3 3 4 2], 1, 2, 4, 2)
id2=vec2ind([3 3 4 2], [1 2 4 2])

%disp('Testando fuera del rango 4D');
%id1=sub2ind([3 3 4 2], 1, 2, 5, 2)
%id2=vec2ind([3 3 4 2], [1 2 5 2])
