[ x y] = meshgrid(-8: 0.5: 8);
r = sqrt(x.^2 + y.^2)  + eps;
z = sin(r)./r;
surf(x, y, z, 'facecolor', 'interp', 'edgecolor', 'none', 'facelighting',...
    'phong')
colormap(prism(32))
daspect([5 5 1])
axis tight
view(45, 30)
camlight left
