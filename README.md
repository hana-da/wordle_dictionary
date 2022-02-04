English word dictionary for Wordle
==================================

A collection of five-letter English words from [kujirahand/EJDict](https://github.com/kujirahand/EJDict) for Wordle.

# Hint
## Number of times a character appears

```ruby
puts File.read('wordle.txt').delete("\n").chars.tally.sort_by{ -_2 }.to_h.to_yaml
__END__

---
E: 1691
A: 1490
R: 1183
O: 1115
S: 1037
I: 1019
T: 979
L: 951
N: 865
U: 677
C: 650
Y: 601
D: 573
P: 546
H: 539
M: 482
G: 419
B: 417
K: 307
F: 292
W: 268
V: 219
X: 69
Z: 69
J: 57
Q: 45
```

## Number of times a character appears in each position.

```ruby
puts File.readlines('wordle.txt', chomp: true).map(&:chars).transpose.map{ |c| c.tally.sort_by{ -_2 }.to_h }.to_yaml
__END__

---
- S: 490
  C: 277
  B: 252
  P: 214
  A: 208
  T: 198
  M: 170
  D: 168
  F: 166
  G: 149
  L: 144
  R: 124
  W: 115
  H: 105
  E: 86
  N: 72
  V: 63
  O: 59
  I: 52
  K: 51
  J: 47
  U: 44
  Q: 33
  Y: 15
  Z: 6
  X: 4
- A: 489
  O: 442
  E: 359
  R: 331
  I: 327
  U: 276
  L: 236
  H: 190
  N: 110
  T: 99
  P: 76
  C: 60
  W: 58
  M: 53
  Y: 33
  D: 30
  S: 28
  B: 21
  V: 20
  K: 17
  X: 17
  G: 16
  F: 9
  Q: 8
  Z: 4
  J: 3
- A: 397
  I: 355
  O: 303
  R: 267
  E: 236
  N: 229
  U: 211
  L: 173
  T: 158
  S: 125
  D: 120
  G: 96
  M: 95
  P: 92
  B: 87
  C: 81
  V: 73
  W: 38
  Y: 38
  F: 35
  K: 27
  H: 24
  X: 24
  Z: 21
  J: 4
  Q: 3
- E: 450
  A: 255
  N: 248
  I: 244
  S: 228
  R: 214
  L: 203
  T: 199
  O: 198
  C: 191
  U: 133
  G: 116
  M: 98
  D: 91
  P: 84
  K: 82
  V: 63
  F: 48
  H: 46
  B: 38
  Z: 33
  W: 32
  Y: 11
  J: 3
  X: 3
  Q: 1
- E: 560
  Y: 504
  T: 325
  R: 247
  N: 206
  L: 195
  H: 174
  S: 166
  D: 164
  A: 141
  K: 130
  O: 113
  P: 80
  M: 66
  G: 42
  I: 41
  C: 41
  F: 34
  W: 25
  X: 21
  B: 19
  U: 13
  Z: 5
```

## The Best Word

```ruby

puts File.readlines('uniq.txt', chomp: true).grep(/#{Regexp.union(File.read('wordle.txt').delete("\n").chars.tally.sort_by{ -_2 }.to_h.keys.first(5))}{5}/)
__END__
AROSE
```

# License

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png)](http://creativecommons.org/publicdomain/zero/1.0/) CC0 1.0 Universal (CC0 1.0) Public Domain Dedication
