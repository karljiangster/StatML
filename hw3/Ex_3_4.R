#Examples for 3 and 4) 

library(rpart)

n = 10
x1 = seq(from = -5, to = 4, length.out = n)
x2 = rep(1, n)
y = rep(c(TRUE, FALSE), n/2)

df_non = data.frame(x1 = x1, x2 = x2, y = y)

plot(x2 ~ x1, data = df_non, subset = y == TRUE, main = "Nonlinear Seperable Data")
points(x2 ~ x1, data = df_non, subset = y == FALSE, pch = 18)

tree_non = rpart(y ~ x2 + x1, data = df_non, control = NA, method = "class", cp = 0)
plot(tree_non)
summary(tree_non)


#LINEAR CASE: 

x2_lin = c( x1 + 1, x1 - 1) 
y_lin = c(rep(TRUE, n), rep(FALSE, n))
df_lin = data.frame(x1 = x1, x2 = x2_lin, y = y_lin)

plot(x2 ~ x1, data = df_lin, subset = y == TRUE, ylim = c(-6, 6), xlim = c(-6,6))
points(x2 ~ x1, data = df_lin, subset = y == FALSE, pch = 18)
abline(a = 0, b = 1)
