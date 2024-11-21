#'''Stabilne Q'''

# (x0,y0)=(1,1)
leg3<-c('wiewiórki rude','wiewiórki szare','kuny leśne')
leg2<-c('wiewiórki rude','wiewiórki szare')
parametry_I=c(1,1,1,  10,11,  1.5, 0.4,  0.4,1.2,  1 ,1.1,  6.1,  0.4,0.6)#
parametry_I_bez_z=c(1,1,0,  10,11,  1.5, 0.4,  0.4,1.2,  1 ,1.1,  6.1,  0.4,0.6)#

# sama konkurencja   -  takie samo
n=3000
h=0.1
t=(1:n)*h
lin0=RK4_3(parametry_I_bez_z,n,h)
plot(t,lin0[,1] ,type='l', ylim=c(0,11.5),lwd=1.5, col='orange',
     main='Wykres zależności liczebnośc populacji\nod czasu przy braku drapieżników', xlab="t", 
     ylab="liczebność populacji")
lines(lin0[,2] ,type='l', add=T, lwd=1.5, col='gray')
grid()
legend('right' ,legend=c('wiewiórki rude','wiewiórki szare'),
       col=c('orange','gray'), lwd=c(1.5,1.5),
       horiz=F, cex=0.8)

##############################
# z drapieżnikiem

n=220000
t=(1:n)*h
lin1=RK4_3(parametry_I,n,h)
plot(t,lin1[,1] ,type='l',ylim=c(0,7.5),lwd=1.5, col='orange',
     main='Wykres zależności liczebności populacji\nod czasu przy obecności drapieżników',
     xlab="t", ylab="liczebność populacji")
lines(lin1[,2] ,type='l', add=T, lwd=1.5, col='gray')
lines(lin1[,3] ,type='l', add=T,lwd=1.5, col='green')
grid()
legend('top' ,legend=c('wiewiórki rude','wiewiórki szare','kuny leśne'),
       col=c('orange','gray','green'), lwd=c(1.5,1.5,1.5),
       horiz=T, cex=0.5)



######## porównanie wykresów
n=3000
h=0.5
t=(1:n)*h
lin1=RK4_3(parametry_I,n,h)
plot(t,lin1[,1] ,type='l',lwd=1.5, col='orange',ylim=c(0,11),
     main='Porównanie zmian liczebności populacji w czasie\n przy braku i obecności drapieżnika
w skali logarytmicznej dla t',
     xlab="t", ylab="liczebność populacji",log='x')
lines(lin1[,2] ,type='l', add=T, lwd=1.5, col='gray')
lines(lin1[,3] ,type='l', add=T,lwd=1.5, col='green')
grid()


lin0=RK4_3(parametry_I_bez_z,n,h)
lines(t,lin0[,1] ,type='l', ylim=c(0,11.5),lwd=1.5,lty=2, col='orange',
      main='Wykres zależności liczebności\npopulacji od czasu', xlab="t", 
      ylab="liczebność populacji",add=T)
lines(t,lin0[,2] ,type='l',  lwd=1.5,lty=2 ,col='gray',add=T) 

legend(11.3,9,legend=leg3,
       col=c('orange','gray','green'), lwd=c(1.5,1.5,1.5),
       horiz=T, cex=0.4, title="konkurencja + drapieżnictwo")
legend(121,10.5,legend=leg2,
       col=c('orange','gray'), lwd=(1.5),lty=2,
       horiz=T, cex=0.4, title="sama konkurencja")




##############################################################################
##############################################################################

Q=stacjonarne(parametry_I)$Q
R=round(Q+0.5,2)
R<-c(0.5,6.5,0.75)

r=paste0(   '('    ,R[1],  ',' ,R[2],  ','   ,0,')')
rr=paste0(   '('    ,R[1],  ',' ,R[2],  ','   ,R[3],')')
# (x0,y0,z0)=R
nam=paste('Wykres zależności liczebności populacji\nod czasu przy braku drapieżników
dla warunku początkowego',r)
nam1=paste('Wykres zależności liczebności populacji\nod czasu przy obecności drapieżników
dla warunku początkowego',r)

parametry_I=c(R,  parametry_I[4:14])
parametry_I_bez_z=c(R[1:2],0,  parametry_I[4:14])
# sama konkurencja   
n=4000
h=0.1
t=(1:n)*h
lin0=RK4_3(parametry_I_bez_z,n,h)
plot(t,lin0[,1] ,type='l', ylim=c(0,11.5),lwd=1.5, col='orange',
     main=nam, xlab="t", 
     ylab="liczebność populacji")
lines(lin0[,2] ,type='l', add=T, lwd=1.5, col='gray')
grid()
legend('right' ,legend=c('wiewiórki rude','wiewiórki szare'),
       col=c('orange','gray'), lwd=c(1.5,1.5),
       horiz=F, cex=0.8)
########

#z drapieżnikiem
n=8000;h=0.1
t=(1:n)*h
lin1=RK4_3(parametry_I,n,h)
plot(t,lin1[,1] ,type='l',ylim=c(0,6.5),lwd=1.5, col='orange',#log='x',
     main=nam,
     xlab="t", ylab="liczebność populacji")
lines(lin1[,2] ,type='l', add=T, lwd=1.5, col='gray')
lines(lin1[,3] ,type='l', add=T,lwd=1.5, col='green')
grid()
legend('right' ,legend=c('wiewiórki rude','wiewiórki szare','kuny leśne'),
       col=c('orange','gray','green'), lwd=c(1.5,1.5,1.5),
       horiz=T, cex=0.45)

#######
#porownanie

n=5000
t=(1:n)*h
#stacjonarne(parametry_I)

nam3=paste('Porównanie zmian liczebności populacji w czasie\ndla warunku początkowego', r ,'i', rr)
######## porównanie wykresów
lin1=RK4_3(parametry_I,n,h)
plot(t,lin1[,1] ,type='l', lwd=1.5,ylim=c(0,11), col='orange',
     main=nam3,
     xlab="t", ylab="liczebność populacji")
lines(lin1[,2] ,type='l', add=T, lwd=1.5, col='gray')
lines(lin1[,3] ,type='l', add=T,lwd=1.5, col='green',log='y')
grid()


lin0=RK4_3(parametry_I_bez_z,n,h)
lines(t,lin0[,1] ,type='l', ylim=c(0,11.5),lwd=1.5,lty=2, col='orange',
      main='Wykres zależności liczebności\npopulacji od czasu', xlab="t", 
      ylab="liczebność populacji",add=T)
lines(t,lin0[,2] ,type='l',  lwd=1.5,lty=2 ,col='gray',add=T) 

legend(50,9,legend=leg3,
       col=c('orange','gray','green'), lwd=c(1.5,1.5,1.5),
       horiz=T, cex=0.5, title="konkurencja + drapieżnictwo")

legend(80,4,legend=leg2,
       col=c('orange','gray'), lwd=1.5,lty=2,
       horiz=T, cex=0.6, title="sama konkurencja")

############################
#############wykres 3d



n=20000
parametry_I=c(1,1,1,  10,11,  1.5, 0.4,  0.4,1.2,  1 ,1.1,  6.1,  0.4,0.6)#
parametry_I_bez_z=c(1,1,0,  10,11,  1.5, 0.4,  0.4,1.2,  1 ,1.1,  6.1,  0.4,0.6)#

n=20000
fig<-plot_ly()
fig<-add_1stacjo(fig,parametry_I,3)
fig<-add_1stacjo(fig,parametry_I,4)
fig<-add_1stacjo(fig,parametry_I,5)

lin1=RK4_3(parametry_I,n,h)
lin0=RK4_3(parametry_I_bez_z,n,h)

fig <- fig %>% add_trace(  x = lin0[,1], y = lin0[,2], z = lin0[,3],type = 'scatter3d', mode = 'lines',
                           line = list(color = 'blue', width = 3), name=paste0('(1,1,0)') )



fig <- fig %>% add_trace(  x = lin1[,1], y = lin1[,2], z = lin1[,3],type = 'scatter3d', mode = 'lines',
                           line = list(color = 'darkviolet', width = 3), name=paste0('(1,1,1)') )

h=0.1;n=10000



parametry_I=c(R,  parametry_I[4:14])
parametry_I_bez_z=c(R[1:2],0,  parametry_I[4:14])

lin1=RK4_3(parametry_I,n,h)
lin0=RK4_3(parametry_I_bez_z,n,h)
fig <- fig %>% add_trace(  x = lin0[,1], y = lin0[,2], z = lin0[,3],type = 'scatter3d', mode = 'lines',
                           line = list(color = 'powderblue', width = 3), name=r )

h=0.1;n=5000

fig <- fig %>% add_trace(  x = lin1[,1], y = lin1[,2], z = lin1[,3],type = 'scatter3d', mode = 'lines',
                           line = list(color = 'violet', width = 3), name=rr)



withr::with_dir(abcd,htmlwidgets::saveWidget(fig, "stab_P_I_Q.html"))


fig<-plot_ly()
fig<-add_trajektorie_1pkt(fig,parametry_I,3, krok=0.5, N=4)
fig<-add_trajektorie_1pkt(fig,parametry_I,5, krok=0.5, N=4)
fig 
withr::with_dir(abcd,htmlwidgets::saveWidget(fig, "stab_P_I_Q_2.html"))


 