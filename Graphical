clc;
clear all;

c = [3 2];
a = [2 4; 3 5];
b = [8; 15]; 

x = 0:1:max(b);

y1 = (b(1) - a(1,1).* x) / a(1,2);
y1 = max (0, y1);
y2 = (b(2) - a(2,1).* x) / a(2,2);
y2 = max (0, y2);

plot (x, y1, 'g', x, y2, 'b');

cx = find (x == 0);
c1 = find (y1 == 0);
c2 = find (y2 == 0);

l1 = [x([cx c1]); y1([cx c1])]';
l2 = [x([cx c2]); y2([cx c2])]';

l = [l1; l2];
l1 = unique(l, 'rows');

x = [0; 0];
for i = 1:size(a,1)
    a1 = a(i,:);
    b1 = b(i);
    
    for j = i+1:size(a,1)
        a2 = a(j,:);
        b2 = b(j);
        
        aa = [a1; a2];
        bb = [b1; b2];
        
        xx = inv(aa) * bb;
        xx = [xx x];

    end
end

point = xx';

pp = [l1; point];
pp1 = unique (pp, 'rows')

for i=1:size(pp1, 1)
    con1(i) = a(1,1) * pp1(i,1) + a(1,2) * pp1 (i,2)- b(1)
    con2(i) = a(2,1) * pp1(i,1) + a(2,2) * pp1 (i,2) - b(2)
    con3(i) = pp1(i,1)
    con4(i) = pp1(i,2)
    
    s1 = find(con1 > 0)
    s2 = find(con2 < 0)
    s3 = find(con3 < 0)
    s4 = find(con4 < 0)
end
s = unique([s1 s2 s3 s4])

pp1(s, :) = []

val = pp1 * c'

table = [pp1 val]
