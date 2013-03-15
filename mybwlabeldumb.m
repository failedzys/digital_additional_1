function [ Ans ] = mybwlabeldumb( bwmap ,conX)
[n,m] = size(bwmap);
Chg = [1 0; 0 1; -1 0; 0 -1; 1 1; 1 -1; -1 1; -1 -1];
Ans = uint32(zeros(n,m));
Queue = uint32(zeros(n*m,2));
cnt = uint32(0);
for ii = 1 : n
    for jj = 1 : m
        if (bwmap(ii,jj) == 1 && Ans(ii,jj) == 0)
            cnt = cnt+1;
            Queue(1,1) = ii;
            Queue(1,2) = jj;
            Ans(ii,jj) = cnt;
            Now = uint32(1);
            Sum = uint32(1);
            while Now <= Sum
                for kk = 1 : conX
                    if (Queue(Now,1) + Chg(kk,1) <= n && Queue(Now,1) + Chg(kk,1) >= 1 && Queue(Now,2) + Chg(kk,2) <= m && Queue(Now,2) + Chg(kk,2) >= 1)
                        if (Ans(Queue(Now,1) + Chg(kk,1),Queue(Now,2) + Chg(kk,2)) == 0 && bwmap(Queue(Now,1) + Chg(kk,1),Queue(Now,2) + Chg(kk,2)) == 1)
                            Sum = Sum + 1;
                            Queue(Sum,1) = Queue(Now,1) + Chg(kk,1);
                            Queue(Sum,2) = Queue(Now,2) + Chg(kk,2);
                            Ans(Queue(Now,1) + Chg(kk,1),Queue(Now,2) + Chg(kk,2)) = cnt;
                        end
                    end
                end
                Now = Now + 1;
            end
        end
    end
end

end

