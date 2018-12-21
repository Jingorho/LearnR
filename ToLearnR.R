setwd("/Users/yukako/WorkSpace/ToLearnR/")
students <- read.csv("data/students.csv")
head(students)

# 抽出するときは列名でも列番号でもok
students[, 3]      # 列番号で
students[, "area"] # 列名で
# どちらの結果も以下の通り
# [1] Kansai Kansai Kanto  Tohoku Kanto  Kanto  Tohoku Kansai Kanto  Tohoku
# [11] Kansai Kansai Kanto  Kansai Tohoku Kansai Kanto  Kanto  Tohoku Kanto 
# [21] Tohoku Kanto  Kansai Tohoku Kanto  Kansai Kansai Kanto  Kanto  Kanto 
# [31] Kanto  Tohoku Kanto  Tohoku Kanto  Kansai Kanto  Kanto  Kanto  Kanto 
# Levels: Kansai Kanto Tohoku

# 複数列をいっぺんに抽出するとき
students[, c(3, 5)]             # 列番号で
students[, c("area", "gender")] # 列名で
# どちらの結果も以下の通り
#    area  gender
# 1  Kansai   male
# 2  Kansai   male
# 3   Kanto   male
# 4  Tohoku   male
# 5   Kanto   male
# ... (省略)



# 削るときは列名で指定できない、列番号のみ
students[, -3] # 列番号で
#     height income glasses gender university
# 1     153    341     YES   male       Keio
# 2     168    794      NO   male     Waseda
# 3     153    832      NO   male       Keio
# 4     188    721      NO   male       Keio
# 5     175    840      NO   male     Waseda
# ... (省略)

students[, -c("area")] # できない
# Error in -c("area") : invalid argument to unary operator

students[, -c(3, 5)]
#   height income glasses university
# 1     153    341     YES       Keio
# 2     168    794      NO     Waseda
# 3     153    832      NO       Keio
# 4     188    721      NO       Keio
# 5     175    840      NO     Waseda
# ... (省略)

students[, -c("area", "gender")] # できない
# Error in -c("area", "gender") : invalid argument to unary operator


# 「これ以外」で列名を指定できる
students[, setdiff(names(students), "area")]
students[, !(names(students) %in% "area")]

students[, setdiff(names(students), c("area", "gender"))]
students[, !(names(students) %in% c("area", "gender"))]

