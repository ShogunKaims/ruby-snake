# ruby-snake

A terminal Snake game in pure Ruby, with no gems at runtime. I built it step by step, test-first with RSpec, to practice Ruby and object-oriented design.

![Demo](demo.gif)

## Run it

Requires Ruby 3+ (check with `ruby -v`).

    git clone https://github.com/KaimsKamal/ruby-snake.git
    cd ruby-snake
    ruby bin/snake

## Controls

| Key | Action |
|-----|--------|
| `I` or ↑ | up |
| `K` or ↓ | down |
| `J` or ← | left |
| `L` or → | right |
| `Q` | quit |

Eat the `*` to grow. The game ends when you hit a wall or your own body.

## Tests

    gem install rspec
    rspec

## Design

| File | Role |
|------|------|
| `lib/snake.rb` | Snake state: body, direction, movement, growth, self-collision |
| `lib/food.rb` | Food placement, never on top of the snake |
| `lib/board.rb` | Grid bounds check and text rendering |
| `lib/game.rb` | Rules of one turn (`tick`): move, eat, score, game over |
| `bin/snake` | Terminal loop: raw keyboard input, timing, display |

The game logic never touches the terminal, so every rule is unit-tested. Only `bin/snake` deals with input and screen.

## License

MIT
