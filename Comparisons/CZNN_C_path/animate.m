function animate(tg,carcar)
    %VERSION of April 15th, 2001
	np=numrows(tg);%tgÎªqAll
	n=4;
    erasemode='xor';
    figure(gcf);%bring to the top
%     grid on
	title('LJCARTOON');
	xlabel('X');ylabel('Y');zlabel('Z');
	set(gca,'drawmode','fast');%get handle of current axes, but ?
	line('xdata', [0;0], 'ydata', [0;0],  'zdata', [0;0],'color', 'magenta');
	
    %create a line which we will subsequently modify. Set erase mode to xor for fast update
	hr=line('color', 'black', 'erasemode', erasemode,'LineWidth',2.5);
%     hw=line('color', 'green', 'erasemode', erasemode);%ÂÖ×Ó
	hx=line('xdata', [0;0], 'ydata', [0;0], 'zdata', [0;0], ...
		'color', 'red', 'erasemode', 'xor');
	hy=line('xdata', [0;0], 'ydata', [0;0], 'zdata', [0;0], ...
		'color', 'green', 'erasemode', 'xor');
    hz=line('xdata', [0;0], 'ydata', [0;0], 'zdata', [0;0], ...
		'color', 'blue', 'erasemode', 'xor');
    for repeat=1:1,%repeat times
        for p=1:np,
            [x,y,z]=position(tg(p,:));
            xcar=[carcar(p,1);carcar(p,2);carcar(p,3);carcar(p,4);x];
            ycar=[carcar(p,5);carcar(p,6);carcar(p,7);carcar(p,8);y];
            zcar=[carcar(p,9);carcar(p,10);carcar(p,11);carcar(p,12);z];
            %update the line segments, wrist axis and links
            set(hr,'xdata',xcar,'ydata',ycar,'zdata',zcar);
            drawnow        
            for ii=1:10000000,iii=ii^2;end;
        end
%         axis equal
    end
    