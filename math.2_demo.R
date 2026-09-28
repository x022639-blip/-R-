# 蒙特卡洛模拟：大数定律验证 抛硬币实验
# 理论概率：正面=0.5

# 设置模拟总次数
n_sim <- 100000

# 随机模拟：1=正面，0=反面
coin <- sample(c(0,1), size = n_sim, replace = TRUE, prob = c(0.5,0.5))

# 累积正面次数
cum_positive <- cumsum(coin)
# 累积频率
cum_freq <- cum_positive / (1:n_sim)

# 输出最终频率
final_freq <- cum_freq[n_sim]
cat("模拟总次数：", n_sim, "\n")
cat("正面的最终频率：", final_freq, "\n")
cat("理论概率：0.5\n")

# 保存绘图到图片，避免Codespaces大量警告
png("law_of_large_number.png", width = 800, height = 500)
plot(1:n_sim, cum_freq, type = "l", ylim = c(0.4,0.6),
     main = "蒙特卡洛模拟：大数定律",
     xlab = "试验次数", ylab = "正面频率", col = "#2980b9")
# 画理论参考线
abline(h = 0.5, col = "red", lwd = 2, lty = 2)
dev.off()
