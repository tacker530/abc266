# D - Snuke Panic (1D)
N = gets.chomp.to_i
turns = 0
snuke = {}
N.times do |i|
  x = gets.chomp.split.map(&:to_i) 
  snuke[x[0]] = [x[1],x[2]]
  turns = x[0] if x[0] >= turns # 最終の時刻
end
turns += 1 # 時刻＋１の回数


# dp を作る
dp = Array.new(turns,Array.new(5,0))

turns.times do |i|  # 1秒ごとに実行

  pp dp


  if snuke[i] then     # その秒数のスヌケ君
    hole = snuke[i][0] # 出てきた穴
    qty =  snuke[i][1] # 大きさ
  else
    hole = -1 # 仮にゼロ番目の穴
    qty  = 0 # 値はゼロ
  end

  5.times do |j|    # 穴ごとに実行
    puts "i = #{i}, j= #{j}, snuke[#{i}]=#{snuke[i]}, hole =#{hole}, qty = #{qty}"
    stay = 0
    forward = 0
    backward = 0

    if j == hole then
      # 移動しない
      stay    = qty + dp[i -1][j]
      # 進む
      forward = qty + dp[i -1][j - 1] if j > 0
      # 戻る
      backward = qty + dp[i -1][j + 1] if j < 4
      dp[i][j] = [stay,forward,backward].max
    else
      # 移動しない
      stay    = qty + dp[i -1][j]
      # 進む
      forward = qty + dp[i -1][j - 1] if j > 0
      # 戻る
      backward = qty + dp[i -1][j + 1] if j < 4
      dp[i][j] = [stay,forward,backward].max

    end
  end
end

pp dp[-1].max