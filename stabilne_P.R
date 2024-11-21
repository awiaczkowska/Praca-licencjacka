'''Niestabilne Q'''

# (x0,y0)=(1,1)

# sama konkurencja
parametry_I_bez_z=c(1,1,0,  10,11,  1.5, 0.4,  0.4,0.8,   0.3 ,0.4,  1,  0.4,0.6)

n=3000
h=0.1
t=(1:n)*h
lin0=RK4_3(parametry_I_bez_z,n,h)
plot(t,lin0[,1] ,type='l', ylim=c(0,11.5),lwd=1.5, col='orange',
     main='Wykres zależności liczebności populacji\nod czasu przy braku drapieżników', xlab="t", 
     ylab="liczebność populacji")
lines(lin0[,2] ,type='l', add=T, lwd=1.5, col='gray')
grid()
legend('right' ,legend=c('wiewiórki rude','wiewiórki szare'),
       col=c('orange','gray'), lwd=c(1.5,1.5),
       horiz=F, cex=0.8)

##############################
# z drapieżnikiem
parametry_I=c(1,1,1,  10,11,  1.5, 0.4,  0.4,0.8,   0.3 ,0.4,  1,  0.4,0.6)
n=10000
t=(1:n)*h
lin1=RK4_3(parametry_I,n,h)
plot(t,lin1[,1] ,type='l',ylim=c(0,3.5),lwd=1.5, col='orange',
     main='Wykres zależności liczebności populacji\nod czasu przy obecności drapieżników',
     xlab="t", ylab="liczebność populacji")
lines(lin1[,2] ,type='l', add=T, lwd=1.5, col='gray')
lines(lin1[,3] ,type='l', add=T,lwd=1.5, col='green')
grid()
legend('right' ,legend=c('wiewiórki rude','wiewiórki szare','kuny leśne'),
       col=c('orange','gray','green'), lwd=c(1.5,1.5,1.5),
       horiz=F, cex=0.7)

######## porównanie wykresów

parametry_I=c(1,1,1,  10,11,  1.5, 0.4,  0.4,0.8,   0.3 ,0.4,  1,  0.4,0.6)
n=9000
t=(1:n)*h
lin1=RK4_3(parametry_I,n,h)
plot(t,lin1[,1] ,type='l', ylim=c(0,11),lwd=1.5, col='orange',
     main='Porównanie zmian liczebności populacji\n w czasie  przy braku i obecności drapieżnika',
     xlab="t", ylab="liczebność populacji")
lines(lin1[,2] ,type='l', add=T, lwd=1.5, col='gray')
lines(lin1[,3] ,type='l', add=T,lwd=1.5, col='green')
grid()



lin0=RK4_3(parametry_I_bez_z,n,h)
lines(t,lin0[,1] ,type='l', ylim=c(0,11.5),lwd=1.5,lty=2, col='orange',
      xlab="t", 
     ylab="liczebność populacji",add=T)
lines(t,lin0[,2] ,type='l',  lwd=1.5,lty=2 ,col='gray',add=T) 

legend('center',legend=c('wiewiórki rude','wiewiórki szare','kuny leśne'),
       col=c('orange','gray','green'), lwd=c(1.5,1.5,1.5),
       horiz=T, cex=0.5, title="konkurencja + drapieżnictwo")
legend(170, 10,legend=c('wiewiórki rude','wiewiórki szare'),
       col=c('orange','gray'), lwd=c(1.5,1.5),
       horiz=T, cex=0.5, title="sama konkurencja", lty=2)


##############################################################################
# zmiana warunków początkowych 
##############################################################################
leg3<-c('wiewiórki rude','wiewiórki szare','kuny leśne')
leg2<-c('wiewiórki rude','wiewiórki szare')
Q=stacjonarne(parametry_I)$Q
O=round(Q+0.1,2)

o=paste0(   '('    ,O[1],  ',' ,O[2],  ','   ,0,')')
oo=paste0(   '('    ,O[1],  ',' ,O[2],  ','   ,O[3],')')
# (x0,y0)=O

# sama konkurencja
parametry_I_bez_z=c(O[1],O[2],parametry_I_bez_z[3:14])

n=3000
h=0.1
t=(1:n)*h
lin0=RK4_3(parametry_I_bez_z,n,h)
plot(t,lin0[,1] ,type='l', ylim=c(0,11.5),lwd=1.5, col='orange',
     main=paste('Wykres zależności liczebnoścnpopulacji\nod czasu przy braku drapieżników
dla warunku początkowego',o),
     xlab="t",  
     ylab="liczebność populacji")
lines(lin0[,2] ,type='l', add=T, lwd=1.5, col='gray')
grid()
legend('right' ,legend=c('wiewiórki rude','wiewiórki szare'),
       col=c('orange','gray'), lwd=c(1.5,1.5),
       horiz=F, cex=0.8)

##########

# z drapieżnikiem
parametry_I=c(O,  parametry_I[4:14])
n=10000
t=(1:n)*h

name=paste('Wykres zależności liczebnoścnpopulacji\nod czasu przy braku drapieżników
dla warunku początkowego',oo)
#stacjonarne(parametry_I)
lin1=RK4_3(parametry_I,n,h)
plot(t,lin1[,1] ,type='l',ylim=c(0,3.5),lwd=1.5, col='orange',
     main=name,
     xlab="t", ylab="liczebność populacji")
lines(lin1[,2] ,type='l', add=T, lwd=1.5, col='gray')
lines(lin1[,3] ,type='l', add=T,lwd=1.5, col='green')
grid()
legend(626,3.2  ,legend=leg3,
       col=c('orange','gray','green'), lwd=c(1.5,1.5,1.5),
       horiz=F, cex=0.7)

######## porównanie wykresów
n=10000
t=(1:n)*h
lin1=RK4_3(parametry_I,n,h)
nam=paste('Porównanie zmian liczebności populacji w czasie\ndla warunku początkowego', o ,'i', oo)
plot(t,lin1[,1] ,type='l', ylim=c(0,11),lwd=1.5, col='orange',
     main=nam,
     xlab="t", ylab="liczebność populacji")
lines(lin1[,2] ,type='l', add=T, lwd=1.5, col='gray')
lines(lin1[,3] ,type='l', add=T,lwd=1.5, col='green')
grid()


lin0=RK4_3(parametry_I_bez_z,n,h)
lines(t,lin0[,1] ,type='l', ylim=c(0,11.5),lwd=1.5,lty=2, col='orange',
      main='Wykres zależności liczebności\npopulacji od czasu', xlab="t", 
      ylab="liczebność populacji",add=T)
lines(t,lin0[,2] ,type='l',  lwd=1.5,lty=2 ,col='gray',add=T) 

legend('center',legend=c('wiewiórki rude','wiewiórki szare','kuny leśne'),
       col=c('orange','gray','green'), lwd=c(1.5,1.5,1.5),
       horiz=T, cex=0.5, title="konkurencja + drapieżnictwo")
legend(190, 10,legend=c('wiewiórki rude','wiewiórki szare'),
       col=c('orange','gray'), lwd=c(1.5,1.5),
       horiz=T, cex=0.5, title="sama konkurencja", lty=2)

##########################################
#Wykres 3d


parametry_I_bez_z=c(1,1,0,  10,11,  1.5, 0.4,  0.4,0.8,   0.3 ,0.4,  1,  0.4,0.6)
parametry_I=c(1,1,1,  10,11,  1.5, 0.4,  0.4,0.8,   0.3 ,0.4,  1,  0.4,0.6)
n=20000
fig<-plot_ly()
fig<-add_1stacjo(fig,parametry_I,3)
fig<-add_1stacjo(fig,parametry_I,4)
fig<-add_1stacjo(fig,parametry_I,5)

lin1=RK4_3(parametry_I,n,h)
lin00=RK4_3(parametry_I_bez_z,n,h)

fig <- fig %>% add_trace(  x = lin00[,1], y = lin00[,2], z = lin00[,3],type = 'scatter3d', mode = 'lines',
                           line = list(color = 'blue', width = 3), name=paste0('(1,1,0)') )



fig <- fig %>% add_trace(  x = lin1[,1], y = lin1[,2], z = lin1[,3],type = 'scatter3d', mode = 'lines',
                           line = list(color = 'darkviolet', width = 3), name=paste0('(1,1,1)') )

h=0.1;n=10000



parametry_I=c(O,  parametry_I[4:14])
parametry_I_bez_z=c(O[1:2],0,  parametry_I[4:14])

lin11=RK4_3(parametry_I,n,h)
lin0=RK4_3(parametry_I_bez_z,n,h)
fig <- fig %>% add_trace(  x = lin0[,1], y = lin0[,2], z = lin0[,3],type = 'scatter3d', mode = 'lines',
                           line = list(color = 'powderblue', width = 3), name=o )

h=0.1;n=5000

fig <- fig %>% add_trace(  x = lin11[,1], y = lin11[,2], z = lin11[,3],type = 'scatter3d', mode = 'lines',
                           line = list(color = 'violet', width = 3), name=oo)



withr::with_dir(abcd,htmlwidgets::saveWidget(fig, "stab_P.html"))


