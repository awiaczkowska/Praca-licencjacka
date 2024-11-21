

########## portrety fazowe 

parametry_I_bez_z=c(1,1,0,  10,11,  1.5, 0.4,  0.4,0.8,   0.3 ,0.4,  1,  0.4,0.6)
stacon=stacjonarne_2d_lst(parametry_I_bez_z)
stacon2=stacjonarne_2d(parametry_I_bez_z)
plot(stacon[[1]],stacon[[2]], ylim=c(-0.5,12), xlab='x', ylab='y',main ="Portret fazowy dla przypadku I")
add_trajektorie2_2d(parametry_I_bez_z, start=c(0,0), koniec=c(12,13),N=6, color='black')
add_trajektorie2_2d(parametry_I_bez_z, start=c(0,0), koniec=c(10,5),N=6, color='black')
add_trajektorie2_2d(parametry_I_bez_z, start=c(0,0), koniec=c(5,13),N=4, color='black')

grid()
add_trajektorie_stacj_2d(parametry_I_bez_z, krok=0.5, N=3, color='black')
lin0=RK4_3(parametry_I_bez_z)
lines(lin0[,1],lin0[,2], type='l', col='blue', lwd=1.5)

curve(izoklina_X_2d(parametry_I_bez_z,x), col='orange',add=T, lwd=3)
curve(izoklina_Y_2d(parametry_I_bez_z,x), col='lightblue3',add=T, lwd=3)

add_quivs(parametry_I_bez_z, N=8, l=0.1, c='red')
legend('topright' ,legend=c('izoklina I_1','izoklina I_2', 'trajektorie'),
       col=c('orange','lightblue3','black'), lwd=c(3,3,1),
       horiz=F, cex=0.6)




######################
parametry_II_bez_z=c(1,1,0,  10,11,  0.5, 0.4,  0.5,0.3, 0.3 ,1,  0.3,  0.4,0.6)
stacon=stacjonarne_2d_lst(parametry_II_bez_z)
plot(stacon[[1]],stacon[[2]], ylim=c(-0.5,13), xlab='x', ylab='y',main ="Portret fazowy dla przypadku II")
add_trajektorie2_2d(parametry_II_bez_z, start=c(0,0), koniec=c(11,12),N=7,
                    color='black')
add_trajektorie2_2d(parametry_II_bez_z, start=c(0,0), koniec=c(4,5),N=5,
                    color='black')
grid()
add_trajektorie_stacj_2d(parametry_II_bez_z, krok=0.5, N=3, color='black')


curve(izoklina_X_2d(parametry_II_bez_z,x), col='orange',add=T, lwd=3)
curve(izoklina_Y_2d(parametry_II_bez_z,x), col='lightblue3',add=T, lwd=3)

add_quivs(parametry_II_bez_z, N=8, c='red')

legend('topright' ,legend=c('izoklina I_1','izoklina I_2', 'trajektorie'),
       col=c('orange','lightblue3','black'), lwd=c(3,3,1),
       horiz=F, cex=0.6)





######################


parametry=parametry_III_bez_z
#vectorfield(fun, c(0,12), c(0,12), n = 4, scale = 0.05, col='blue')
parametry_III_bez_z=c(1,1,0,  10,11,  1.5, 1.4,  0.5,0.3, 1 ,1,  0.3,  0.4,0.6)
stacon=stacjonarne_2d_lst(parametry_III_bez_z)

#plot(stacon[[1]],stacon[[2]], ylim=c(-1,12), xlab='x', ylab='y')
plot(stacon[[1]],stacon[[2]], ylim=c(-0.5,12), xlab='x', ylab='y',main ="Portret fazowy dla przypadku III")
add_trajektorie2_2d(parametry_III_bez_z, start=c(0,0), koniec=c(10,11),N=7,
                    color='black')
add_trajektorie2_2d(parametry_III_bez_z, start=c(0,0), koniec=c(4,5),N=5,
                    color='black')
grid()
add_trajektorie_stacj_2d(parametry_III_bez_z, krok=0.5, N=3, color='black')
#add_trajektorie_stacj_2d(parametry_III_bez_z, krok=0.5, N=3, color='red')


curve(izoklina_X_2d(parametry_III_bez_z,x), col='orange',add=T, lwd=3)
curve(izoklina_Y_2d(parametry_III_bez_z,x), col='lightblue3',add=T, lwd=3)

add_quivs(parametry_III_bez_z, N=8,c='red')

legend('topright' ,legend=c('izoklina I_1','izoklina I_2', 'trajektorie'),
       col=c('orange','lightblue3','black'), lwd=c(3,3,1),
       horiz=F, cex=0.6)
