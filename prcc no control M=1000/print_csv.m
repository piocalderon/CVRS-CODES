apr=abs(prcc)
rank=1:37
[a,i]=sort(apr(1,:),'descend')
PRCC_var(i)
name4=PRCC_var(i)
[a,i]=sort(apr(2,:),'descend')
name6=PRCC_var(i)
[a,i]=sort(apr(3,:),'descend')
name12=PRCC_var(i)
[a,i]=sort(apr(1,:),'descend')
b=prcc(1,:)
cc4=b(i)
[a,i]=sort(apr(2,:),'descend')
cc6=b(i)
[a,i]=sort(apr(3,:),'descend')
[a,i]=sort(apr(2,:),'descend')
b=prcc(2,:)
cc6=b(i)
[a,i]=sort(apr(3,:),'descend')
b=prcc(3,:)
cc6=12(i)
cc12=b(i)
sign
pval12=sign(3,:)
s=sign(3,:)
pval12=s(i)
s=sign(2,:)
[a,i]=sort(apr(2,:),'descend')
pval6=s(i)
[a,i]=sort(apr(1,:),'descend')
s=sign(1,:)
pval4=s(i)
sig4=pval4<0.05
sig6=pval6<0.05
sig12=pval12<0.05
t4=table(ranking,cc4,pval4,sig4)
t4=table(rank,cc4,pval4,sig4)
t6=table(rank,cc6,pval6,sig6)
t12=table(rank,cc12,pval12,sig12)
writeTable(t4)
writetable(t4)
writetable(t6)
writetable(t12)
t4=table(ranking',cc4',pval4',sig4')
t4=table(rank',cc4',pval4',sig4')
t4=table(ranking',name4',cc4',pval4',sig4')
t4=table(rank',name4',cc4',pval4',sig4')
t6=table(rank',name6',cc6',pval6',sig6')
t12=table(rank',name12',cc12',pval12',sig12')
writetable(t4)
writetable(t6)
writetable(t12)
'$'+name4
strcat('$',name4)
name4
name4 = strcat('$',name4)
name4 = strcat(name4,'$')
name6 = strcat('$',name6)
name6 = strcat(name6,'$')
name12 = strcat(name12,'$')
name12 = strcat('$',name12)
t4=table(rank',name4',cc4',pval4',sig4')
t6=table(rank',name6',cc6',pval6',sig6')
t12=table(rank',name12',cc12',pval12',sig12')
writetable(t4)
writetable(t6)
writetable(t12)