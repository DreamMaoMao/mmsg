# mmsg - Send IPC messages to maomaowm

A fork of [dwlmsg](https://codeberg.org/notchoc/dwlmsg)

## Installation

### Arch Linux
```bash
yay -S mmsg-git
```

### Other Distributions
```bash
git clone https://github.com/DreamMaoMao/mmsg
cd mmsg
sudo make install
```

## Usage

Basic syntax:
```
mmsg [-OTL]
mmsg [-o <output>] -s [-t <tags>] [-l <layout>] [-c <tags>]
mmsg [-o <output>] (-g | -w) [-Ootlcvmf] [-d <cmd>,<arg1>,<arg2>]
```

### Options

| Option | Description |
|--------|-------------|
| `-q`   | Quit maomao |
| `-g`   | Get value |
| `-s`   | Set value |
| `-w`   | Watch for changes |
| `-O`   | Get all outputs |
| `-T`   | Get number of tags |
| `-L`   | Get all available layouts |
| `-o`   | Select output |
| `-t`   | Get/set selected tags (set with `[+-^.]`) |
| `-l`   | Get/set current layout |
| `-c`   | Get title and appid of focused client |
| `-v`   | Get visibility of statusbar |
| `-m`   | Get fullscreen status |
| `-f`   | Get floating status |
| `-d`   | Execute maomao dispatch |

## Examples

```bash
mmsg -w  # act like dwl stdout
mmsg -w -c  # watch focused client appid and title
mmsg -O  # get all available outputs
mmsg -w -O  # watch available outputs
mmsg -l 0  # switch to first layout
mmsg -l 'S'  # switch to scroller layout
```

## Execute maomao dispatch

```bash
mmsg -d killclient
mmsg -d resizewin,+10,+10
```

## Use Cases

### Switch Layout
Supported layouts:
- "S" → scroller
- "T" → tile
- "G" → grid
- "M" → monocle
- "D" → dwindle
- "P" → spiral

```bash
mmsg -l "S" # switch to scroller layout
```

### Switch to Tag
```bash
mmsg -t 1 # switch to tag 1
mmsg -t 2 # switch to tag 2
...
mmsg -t 0 # switch to lastfocused tag
```

### Get Tag Message
```bash
mmsg -g -t
```

- State: 0 → none, 1 → active, 2 → urgent

Example output:
| Monitor | Tag Number | Tag State | Clients in Tag | Focused Client |
|---------|------------|-----------|----------------|----------------|
| eDP-1   | tag 2      | 0         | 1              | 0              |


| Monitor | occupied tags mask | active tags mask | urgent tags mask |
|---------|------------|-----------|----------------|
| eDP-1   | 14          |  6             | 0              

### Toggle Tag
```bash
mmsg -s -t 2+ # add current window to tag 2
mmsg -s -t 2- # remove current window from tag 2
mmsg -s -t 2^ # toggle current window in tag 2
```