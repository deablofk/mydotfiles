# Autogenerated config.py
#
# NOTE: config.py is intended for advanced users who are comfortable
# with manually migrating the config file on qutebrowser upgrades. If
# you prefer, you can also configure qutebrowser using the
# :set/:bind/:config-* commands without having to write a config.py
# file.
#
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

# Automatically start playing `<video>` elements.
# Type: Bool
c.content.autoplay = False

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped
# from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped
# from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'devtools://*')

# Allow websites to request geolocations.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
c.content.geolocation = 'ask'

# Value to send in the `Accept-Language` header. Note that the value
# read from JavaScript is always the global value.
# Type: String
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
# c.content.headers.user_agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36'

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'devtools://*')

# Allow JavaScript to read from or write to the clipboard. With
# QtWebEngine, writing the clipboard as response to a user interaction
# is always allowed.
# Type: String
# Valid values:
#   - none: Disable access to clipboard.
#   - access: Allow reading from and writing to the clipboard.
#   - access-paste: Allow accessing the clipboard and pasting clipboard content.
c.content.javascript.clipboard = 'access'

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Use the standard JavaScript modal dialog for `alert()` and
# `confirm()`.
# Type: Bool
c.content.javascript.modal_dialog = True

# Allow locally loaded documents to access remote URLs.
# Type: Bool
config.set('content.local_content_can_access_remote_urls', True, 'file:///home/deablofk/.local/share/qutebrowser/userscripts/*')

# Allow locally loaded documents to access other local URLs.
# Type: Bool
config.set('content.local_content_can_access_file_urls', False, 'file:///home/deablofk/.local/share/qutebrowser/userscripts/*')

# CSS border value for hints.
# Type: String
c.hints.border = 'none'

# Make characters in hint strings uppercase.
# Type: Bool
c.hints.uppercase = True

# Mouse button with which to close tabs.
# Type: String
# Valid values:
#   - right: Close tabs on right-click.
#   - middle: Close tabs on middle-click.
#   - none: Don't close tabs using the mouse.
c.tabs.close_mouse_button = 'right'

# Search engines which can be used via the address bar.  Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` braces.  The following further
# placeholds are defined to configure how special characters in the
# search terms are replaced by safe characters (called 'quoting'):  *
# `{}` and `{semiquoted}` quote everything except slashes; this is the
# most   sensible choice for almost all search engines (for the search
# term   `slash/and&amp` this placeholder expands to `slash/and%26amp`).
# * `{quoted}` quotes all characters (for `slash/and&amp` this
# placeholder   expands to `slash%2Fand%26amp`). * `{unquoted}` quotes
# nothing (for `slash/and&amp` this placeholder   expands to
# `slash/and&amp`). * `{0}` means the same as `{}`, but can be used
# multiple times.  The search engine named `DEFAULT` is used when
# `url.auto_search` is turned on and something else than a URL was
# entered to be opened. Other search engines can be used by prepending
# the search engine name to the search term, e.g. `:open google
# qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://google.com.br/search?q={}'}

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = '#282828'

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = '#282828'

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = '#95A99F'

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = '#181818'

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = '#181818'

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = '#FFDD33'

# Foreground color of the matched text in the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.match.fg = '#F43841'

# Foreground color of the matched text in the completion.
# Type: QtColor
c.colors.completion.match.fg = '#FFDD33'

# Font color for hints.
# Type: QssColor
c.colors.hints.fg = '#181818'

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
# Type: QssColor
c.colors.hints.bg = '#95A99F'

# Font color for the matched part of hints.
# Type: QtColor
c.colors.hints.match.fg = '#FFFFFF'

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = '#E4E4EF'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = '#181818'

# Foreground color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.fg = '#E4E4EF'

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = '#181818'

# Foreground color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.fg = '#181818'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = '#95A99F'

# Foreground color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.fg = '#181818'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = '#95A99F'

# Foreground color of pinned selected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.odd.fg = '#181818'

# Background color of pinned selected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.odd.bg = '#FFDD33'

# Foreground color of pinned selected even tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.even.fg = '#181818'

# Background color of pinned selected even tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.even.bg = '#FFDD33'

# Render all web contents using a dark theme. On QtWebEngine < 6.7, this
# setting requires a restart and does not support URL patterns, only the
# global setting is applied. Example configurations from Chromium's
# `chrome://flags`: - "With simple HSL/CIELAB/RGB-based inversion": Set
# `colors.webpage.darkmode.algorithm` accordingly, and   set
# `colors.webpage.darkmode.policy.images` to `never`.  - "With selective
# image inversion": qutebrowser default settings.
# Type: Bool
c.colors.webpage.darkmode.enabled = False

# Default font families to use. Whenever "default_family" is used in a
# font setting, it's replaced with the fonts listed here. If set to an
# empty value, a system-specific monospace default is used.
# Type: List of Font, or Font
c.fonts.default_family = 'Iosevka Nerd Font'

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = '12pt default_family'
