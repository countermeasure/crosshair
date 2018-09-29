# This file is part of ranger, the console file manager.
# License: GNU GPL version 3, see the file "AUTHORS" for details.

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import (
    normal,
    reverse,
)


# Solarised colors

base03 = 8    # Background tone (darkest) (default background colour)
base02 = 0    # Background tone (dark)
base01 = 10   # Content tone
base00 = 11   # Content tone
base0 = 12    # Content tone (default text colour)
base1 = 14    # Content tone
base2 = 7     # Background tone (light)
base3 = 15    # Background tone (lightest)

yellow = 3    # Accent colour
orange = 9    # Accent colour
red = 1       # Accent colour
magenta = 5   # Accent colour
violet = 13   # Accent colour
blue = 4      # Accent colour
cyan = 6      # Accent colour
green = 2     # Accent colour


default_colors = (base1, base03, normal)


class Default(ColorScheme):
    progress_bar_color = yellow

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            # Reverse text for all selections.
            if context.selected:
                attr = reverse
            else:
                attr = normal
            # Show a faint reversed 'empty' message for empty directories.
            if context.empty:
                fg = base01
                attr = reverse
            # Show errors as reversed red text.
            if context.error:
                attr = reverse
                fg = red
            # Directories are a content tone, and executables are green.
            if context.directory:
                fg = base01
            elif (
                context.executable and
                not any((
                    context.media,
                    context.container,
                    context.fifo,
                    context.socket
                ))
            ):
                fg = green
            # Good (sym)links are cyan, and broken ones are magenta.
            if context.link:
                fg = cyan if context.good else magenta
            # Tags are yellow when not selected.
            if context.tag_marker and not context.selected:
                fg = yellow
            # Cut and copied items are blue when not selected.
            if not context.selected and (context.cut or context.copied):
                fg = yellow
            # Highlight selected item in main column, show marked item in main
            # column as blue.
            if context.main_column:
                if context.selected:
                    fg = yellow
                elif context.marked:
                    fg = yellow
            # TODO: Work out what this does.
            if context.badinfo:
                if attr & reverse:
                    bg = red
                else:
                    fg = red

        elif context.in_titlebar:
            bg = base02
            if context.hostname:
                fg = base01
            elif context.directory:
                fg = yellow
            elif context.file:
                fg = yellow
            elif context.tab:
                fg = yellow
                if context.good:
                    attr = reverse

        elif context.in_statusbar:
            bg = base02
            if context.permissions:
                fg = green if context.good else red
            if context.marked:
                fg = base03
                bg = yellow
            if context.message:
                if context.bad:
                    fg = red
            if context.loaded:
                bg = self.progress_bar_color
                fg = base03

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            # Title is yellow.
            if context.title:
                fg = yellow
            # Show a reversed progress bar.
            if context.selected:
                attr |= reverse
            # Highlight the selected task.
            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                    bg = base03
                else:
                    bg = self.progress_bar_color
                    fg = base01

        return fg, bg, attr
