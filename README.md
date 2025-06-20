# mmsg - Send IPC messages to maomaowm

A fork of [dwlmsg](https://codeberg.org/notchoc/dwlmsg)

## Installation

#### dependcy
```
yay -S cjson
```

### Arch Linux
```bash
yay -S mmsg-git
yay -S mprop-git # a script to get properties of a window by click
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
| `-x`   | Get focused client geometry |

## Use Cases

### Execute maomao dispatch

```bash
mmsg -d killclient
mmsg -d resizewin,+10,+10
```

### Switch Layout
Supported layouts:
- "S" → scroller
- "T" → tile
- "G" → grid
- "M" → monocle
- "D" → dwindle
- "P" → spiral
- "K" → deck

```bash
mmsg -l "S" # switch to scroller layout
```

### Switch to Tag
```bash
mmsg -t 1 # switch to tag 1
mmsg -t 2 # switch to tag 2
```

### get message
```bash
mmsg -w  # watch for all message changes
mmsg -g # get all message without watch
mmsg -w -c  # watch focused client appid and title
mmsg -O  # get all available outputs
mmsg -g -t  # get all tags message
mmsg -g -c  # get current focused client message
```

#### tag message
- State: 0 → none, 1 → active, 2 → urgent

Example output:
| Monitor | Tag Number | Tag State | Clients in Tag | Focused Client |
|---------|------------|-----------|----------------|----------------|
| eDP-1   | tag 2      | 0         | 1              | 0              |


| Monitor | occupied tags mask | active tags mask | urgent tags mask |
|---------|------------|-----------|----------------|
| eDP-1   | 14          |  6             | 0             |

### Toggle Tag
```bash
mmsg -s -t 2+ # add current window to tag 2
mmsg -s -t 2- # remove current window from tag 2
mmsg -s -t 2^ # toggle current window in tag 2
```
