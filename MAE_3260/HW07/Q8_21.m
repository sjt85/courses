G = tf([3, 1],[2, 1, 4])
sys = zpk(G)
sys1 = ss(sys)
sys2 = ss(G)
