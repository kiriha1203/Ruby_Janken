# プレイヤー(自分)に「0 ~ 2」を入力させるロジックを書きます。
class Player
  def hand
    # 「プレイヤーに 0 ~ 2を入力させる文章」を表示させます。
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    # 変数「input_hand」に
    input_hand = gets.to_i
    # プレイヤーが入力したものを取得して代入します。
    # ヒント! 「getsメソッド」を使用します。
    flag = true
    while flag
      if input_hand == 0 || input_hand == 1 || input_hand == 2
        return input_hand
        flag = false
        # 「input_hand」(取得した値)が「0, 1, 2」のいずれかだとwhileから脱出させ、それ以外だと初めから繰り返させます。
        # ヒント! 「while文」を使用します。
        # 【条件分岐】「input_hand」(取得した値)が「0, 1, 2」のいずれかの場合だったとき
        # 「input_hand」(取得した値)をそのまま返します。
        # ヒント！ 「return」を使用します。
      else # 条件外だった場合
        # 「プレイヤーに 0 ~ 2を入力させる文章」を表示させます。
        puts "もう一度数字を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
        input_hand = gets.to_i
        # 変数「input_hand」に
        # プレイヤーが入力したものを取得して代入します。
        flag = true
      end
    end
  end
end
# 敵が「0 ~ 2」の値をランダムで生成するロジックを書きます。
class Enemy
  def hand
    rand(3)
    # グー、チョキ、パーの値をランダムに出力させます。
  end
end

# プレイヤー(自分)が入力した「0 ~ 2」と、敵がランダムで生成した「0 ~ 2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
class Janken
  def pon(player_hand, enemy_hand)
    # 変数「janken」に["グー", "チョキ", "パー"]を代入します。
    janken = ["グー", "チョキ", "パー"]
    #「相手の手は#{敵の生成した値}です。」と出力させます。
    puts "相手の手は#{janken[enemy_hand]}です。"
    if player_hand == enemy_hand
      puts "あいこ"
      # 【条件分岐】もしもプレイヤーと敵の出した値が同じだった場合
      # 「あいこ」を出力します。
      # whileを繰り返す「true」を返してじゃんけんを繰り返し実行させます。
      return true
    elsif (player_hand - enemy_hand + 3 ) % 3 == 2
      puts "あなたの勝ちです"
      return false

      # もしも下記の組み合わせだった場合
      # 例 (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
      # 「あなたの勝ちです」を出力します。
      # whileを終了させる「false」を返してじゃんけんを終了させます。
    else
      puts "あなたの負けです"
      return false
      #  それ以外だった場合
      # 「あなたの負けです」を出力します。
      # whileを終了させる「false」を返してじゃんけんを終了させます。
    end
  end
end


# 変数「player」にPlayerをインスタンス化したものを代入します。
player = Player.new
# 変数「enemy」にEnemyをインスタンス化したものを代入します。
enemy = Enemy.new
# 変数「janken」にJankenをインスタンス化したものを代入します。
janken = Janken.new
# 変数「next_game」に「true」を代入します。
next_game = true
# 「next_game」が「false」にならない限り、永久にwhileで繰り返し処理を実行します。
while next_game
# じゃんけん
# 変数「next_game」に
# じゃんけんを実行して値が返ってきたものを代入します。
# じゃんけんの実行結果に「true」が返ってくると、このwhileを繰り返します。
  next_game = janken.pon(player.hand, enemy.hand)
end