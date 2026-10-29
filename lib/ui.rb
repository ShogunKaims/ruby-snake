module UI
  WIDTH = 60
  INNER = WIDTH - 2

  RESET  = "\e[0m"
  BOLD   = "\e[1m"
  GREEN  = "\e[92m"
  YELLOW = "\e[93m"
  RED    = "\e[91m"
  CYAN   = "\e[96m"
  GRAY   = "\e[90m"

  ANSI = /\e\[[0-9;]*m/
  WIDE_SYMBOLS = [0x2B1B, 0x2B1C, 0x2B50, 0x2B55].freeze

  TITLE_ART = <<~'ART'.lines.map(&:chomp).freeze
 ____  _   _    _    _  _______
/ ___|| \ | |  / \  | |/ / ____|
\___ \|  \| | / _ \ | ' /|  _|
 ___) | |\  |/ ___ \| . \| |___
|____/|_| \_/_/   \_\_|\_\_____|
  ART

  module_function

  def paint(text, *styles)
    "#{styles.join}#{text}#{RESET}"
  end

  def char_width(char)
    code = char.ord
    code >= 0x1F300 || WIDE_SYMBOLS.include?(code) ? 2 : 1
  end

  def visible_width(text)
    text.gsub(ANSI, '').each_char.sum { |char| char_width(char) }
  end

  def pad_right(text, width)
    text + ' ' * [width - visible_width(text), 0].max
  end

  def center(text, width = INNER)
    padding = [width - visible_width(text), 0].max
    left = padding / 2
    ' ' * left + text + ' ' * (padding - left)
  end

  def box(lines, width = WIDTH, color = GREEN)
    inner = width - 2
    side = paint('║', color)
    [
      paint("╔#{'═' * inner}╗", color),
      *lines.map { |line| side + pad_right(line, inner) + side },
      paint("╚#{'═' * inner}╝", color)
    ]
  end

  def frame(text, color = GREEN)
    lines = text.split("\n")
    width = lines.map { |line| visible_width(line) }.max
    box(lines, width + 2, color)
  end

  def status(mode_label, score)
    [
      paint('🐍 SNAKE', GREEN, BOLD),
      paint("[#{mode_label}]", CYAN),
      "Score : #{paint(score, YELLOW, BOLD)}",
      paint('Q : quitter', GRAY)
    ].join('  ')
  end

  def title_screen
    art_width = TITLE_ART.map(&:length).max
    art = TITLE_ART.map { |line| center(paint(line.ljust(art_width), GREEN, BOLD)) }

    options = [
      "#{paint('[1]', CYAN, BOLD)}  Original   #{paint('sortir du tableau = game over', GRAY)}",
      "#{paint('[2]', CYAN, BOLD)}  Chill      #{paint("réapparaît de l'autre côté", GRAY)}"
    ].map { |line| '      ' + line }

    box([
      '',
      *art,
      '',
      center(paint('🐍  Snake dans ton terminal, en Ruby pur  🍎', YELLOW)),
      '',
      *options,
      '',
      center(paint('[Q] quitter', GRAY)),
      ''
    ])
  end

  def game_over_screen(score, mode_label)
    keys = %w[R M Q].map { |key| paint("[#{key}]", CYAN, BOLD) }

    box([
      '',
      center(paint('G A M E   O V E R', RED, BOLD)),
      '',
      center("Score : #{paint(score, YELLOW, BOLD)}    Mode : #{paint(mode_label, CYAN)}"),
      '',
      center("#{keys[0]} Rejouer    #{keys[1]} Changer de mode    #{keys[2]} Quitter"),
      ''
    ], WIDTH, RED)
  end
end
