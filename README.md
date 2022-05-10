
<!-- README.md is generated from README.Rmd. Please edit that file -->

# marble

<!-- badges: start -->
<!-- badges: end -->

marbleはベクトルやデータフレームの特定の変数に対して
色分けを行うためのR言語のパッケージです。

## インストール方法

現在、marbleはCRANには登録されていませんが、次のコマンドを実行することで
インストールが可能です。

``` r
install.packages("marble", repos = "https://uribo.r-universe.dev")
```

## 利用方法

``` r
library(marble)
```

`sazareishi()`は日本語の単語を品詞ごとに色分けします。

``` r
x <-
  c(`名詞` = "吾輩", `助詞` = "は", `名詞` = "猫", 
    `助動詞` = "で", `助動詞` = "ある", `記号` = "。", 
    `名詞` = "名前", `助詞` = "は", `副詞` = "まだ", 
    `形容詞` = "無い", `記号` = "。")
sazareishi(x)
```

<pre> 名詞 助詞 名詞 助動詞 助動詞 記号 名詞 助詞 副詞 形容詞 記号
<span style='color:#e69f00;'><span> "吾輩"</span></span><span style='color:#56b4e9;'><span> "は"  </span></span><span style='color:#e69f00;'><span> "猫"  </span></span><span style='color:#f0e442;'><span> "で"  </span></span><span style='color:#f0e442;'><span> "ある"</span></span><span style='color:#0072b2;'><span> "。"  </span></span><span style='color:#e69f00;'><span> "名前"</span></span><span style='color:#56b4e9;'><span> "は"  </span></span><span style='color:#d55e00;'><span> "まだ"</span></span><span style='color:#cc79a7;'><span> "無い"</span></span><span style='color:#0072b2;'><span> "。"  </span></span></pre>

データフレームに単語と品詞の列がある場合、
`sazareishi_to_df()`によって品詞の列を色分けします。

``` r
d <- 
  data.frame(
    token = unname(x),
    POS1 = names(x))
sazareishi_to_df(d, pos = POS1)
```

<pre><span style='text-decoration:underline;'>     token POS1</span>
1   <span style='color:#ffffff;'><span> 吾輩</span></span><span style='color:#e69f00;'><span> 名詞</span></span>
2   <span style='color:#ffffff;'><span>   は</span></span><span style='color:#56b4e9;'><span> 助詞</span></span>
3   <span style='color:#ffffff;'><span>   猫</span></span><span style='color:#e69f00;'><span> 名詞</span></span>
4   <span style='color:#ffffff;'><span>   で</span></span><span style='color:#f0e442;'><span> 助動詞</span></span>
5   <span style='color:#ffffff;'><span> ある</span></span><span style='color:#f0e442;'><span> 助動詞</span></span>
6   <span style='color:#ffffff;'><span>   。</span></span><span style='color:#0072b2;'><span> 記号</span></span>
7   <span style='color:#ffffff;'><span> 名前</span></span><span style='color:#e69f00;'><span> 名詞</span></span>
8   <span style='color:#ffffff;'><span>   は</span></span><span style='color:#56b4e9;'><span> 助詞</span></span>
9   <span style='color:#ffffff;'><span> まだ</span></span><span style='color:#d55e00;'><span> 副詞</span></span>
10  <span style='color:#ffffff;'><span> 無い</span></span><span style='color:#cc79a7;'><span> 形容詞</span></span>
11  <span style='color:#ffffff;'><span>   。</span></span><span style='color:#0072b2;'><span> 記号</span></span>
</pre>
