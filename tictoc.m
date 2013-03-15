pic1 = imread('doll_bw.jpg');
pic2 = imread('pot_bw.jpg');
pic3 = imread('tesselation_bw.jpg');
multi = 5;
disp('Standard bwlabel cost: ');
t1 = clock;
for ii = 1 : multi
    temp = bwlabel(pic1,4);
    temp = bwlabel(pic2,4);
    temp = bwlabel(pic2,4);
end
t1 = etime(clock,t1) / multi;
disp(t1);
disp('mylabeldumb cost: ');
t1 = clock;
for ii = 1 : multi
    temp = mybwlabeldumb(pic1,4);
    temp = mybwlabeldumb(pic2,4);
    temp = mybwlabeldumb(pic2,4);
end
t1 = etime(clock,t1) / multi;
disp(t1);



