palette = {
    "fg": "#E4E4EF",
    "fg+1": "#F4F4FF",
    "fg+2": "#F5F5F5",
    "white": "#FFFFFF",
    "black": "#000000",
    "bg-1": "#101010",
    "bg": "#181818",
    "bg+1": "#282828",
    "bg+2": "#453D41",
    "bg+3": "#484848",
    "bg+4": "#52494E",
    "red-1": "#C73C3F",
    "red": "#F43841",
    "red+1": "#FF4F58",
    "green": "#74BD56",
    "yellow": "#FFDD33",
    "brown": "#CC8C3C",
    "quartz": "#95A99F",
    "niagara-2": "#303540",
    "niagara-1": "#565F73",
    "niagara": "#96A6C8",
    "wisteria": "#9E95C7",
}


def setup(c):
    # NORMAL TABS
    c.colors.tabs.even.bg = palette["bg"]
    c.colors.tabs.even.fg = palette["fg"]
    c.colors.tabs.odd.bg = palette["bg"]
    c.colors.tabs.odd.fg = palette["fg"]

    # SELECTED TABS
    c.colors.tabs.selected.even.bg = palette["quartz"]
    c.colors.tabs.selected.even.fg = palette["bg"]
    c.colors.tabs.selected.odd.bg = palette["quartz"]
    c.colors.tabs.selected.odd.fg = palette["bg"]

    # PINNED TABS
    c.colors.tabs.pinned.selected.even.bg = palette["yellow"]
    c.colors.tabs.pinned.selected.even.fg = palette["bg"]
    c.colors.tabs.pinned.selected.odd.bg = palette["yellow"]
    c.colors.tabs.pinned.selected.odd.fg = palette["bg"]

    # COMPLETION MENU
    c.colors.completion.category.bg = palette["bg"]
    c.colors.completion.category.fg = palette["quartz"]
    c.colors.completion.even.bg = palette["bg+1"]
    c.colors.completion.odd.bg = palette["bg+1"]
    c.colors.completion.match.fg = palette["yellow"]
    c.colors.completion.item.selected.bg = palette["yellow"]
    c.colors.completion.item.selected.fg = palette["bg"]
    c.colors.completion.item.selected.match.fg = palette["red"]

    # HINTS
    c.colors.hints.fg = palette["bg"]
    c.colors.hints.bg = palette["quartz"]
    c.colors.hints.match.fg = palette["white"]
    c.hints.border = "none"
    c.hints.uppercase = True

    # FONTS
    c.fonts.default_family = "Iosevka Nerd Font"
    c.fonts.completion.entry = "12pt default_family"
