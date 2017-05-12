% HW4Q5

syms r_old r_young r_i

eq1 = (r_young^4 - r_i^4)/r_young == 0.8*(r_old^4 - r_i^4)/r_old

solve(eq1,r_old)