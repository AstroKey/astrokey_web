
# Key JSON definitions
module.exports = [
    { row: 'r4', key: '`', shift: '~', keycode: 192 }
    { row: 'r4', key: '1', shift: '!', keycode: 49 }
    { row: 'r4', key: '2', shift: '@', keycode: 50 }
    { row: 'r4', key: '3', shift: '#', keycode: 51 }
    { row: 'r4', key: '4', shift: '$', keycode: 52 }
    { row: 'r4', key: '5', shift: '%', keycode: 53 }
    { row: 'r4', key: '6', shift: '^', keycode: 54 }
    { row: 'r4', key: '7', shift: '&', keycode: 55 }
    { row: 'r4', key: '8', shift: '*', keycode: 56 }
    { row: 'r4', key: '9', shift: '(', keycode: 57 }
    { row: 'r4', key: '0', shift: ')', keycode: 48 }
    { row: 'r4', key: '-', shift: '_', keycode: 189 }
    { row: 'r4', key: '=', shift: '+', keycode: 187 }
    { row: 'r4', key: 'BACKSPACE', keycode: 8, css: 'w2_0' }

    { row: 'r3', key: 'TAB', keycode: 9, css: 'w1_5', special: true }
    { row: 'r3', key: 'Q', keycode: 81 }
    { row: 'r3', key: 'W', keycode: 87 }
    { row: 'r3', key: 'E', keycode: 69 }
    { row: 'r3', key: 'R', keycode: 82 }
    { row: 'r3', key: 'T', keycode: 84 }
    { row: 'r3', key: 'Y', keycode: 89 }
    { row: 'r3', key: 'U', keycode: 85 }
    { row: 'r3', key: 'I', keycode: 73 }
    { row: 'r3', key: 'O', keycode: 79 }
    { row: 'r3', key: 'P', keycode: 80 }
    { row: 'r3', key: '[', shift: '{', keycode: 219 }
    { row: 'r3', key: ']', shift: '}', keycode: 221 }
    { row: 'r3', key: '\\', shift: '|', keycode: 220, css: 'w1_5' }

    { row: 'r2', key: 'CAPS', css: 'w1_75', keycode: 20, special: true }
    { row: 'r2', key: 'A', keycode: 65 }
    { row: 'r2', key: 'S', keycode: 83 }
    { row: 'r2', key: 'D', keycode: 68 }
    { row: 'r2', key: 'F', keycode: 70 }
    { row: 'r2', key: 'G', keycode: 71 }
    { row: 'r2', key: 'H', keycode: 72 }
    { row: 'r2', key: 'J', keycode: 74 }
    { row: 'r2', key: 'K', keycode: 75 }
    { row: 'r2', key: 'L', keycode: 76 }
    { row: 'r2', key: ';', shift: ':', keycode: 186 }
    { row: 'r2', key: "'", shift: '"', keycode: 222 }
    { row: 'r2', key: 'RETURN', css: 'w2_25', keycode: 13, special: true }

    { row: 'r1', key: 'SHIFT', css: 'w2_25', keycode: 16, special: true }
    { row: 'r1', key: 'Z', keycode: 90 }
    { row: 'r1', key: 'X', keycode: 88 }
    { row: 'r1', key: 'C', keycode: 67 }
    { row: 'r1', key: 'V', keycode: 86 }
    { row: 'r1', key: 'B', keycode: 66 }
    { row: 'r1', key: 'N', keycode: 78 }
    { row: 'r1', key: 'M', keycode: 77 }
    { row: 'r1', key: ',', shift: '<', keycode: 188 }
    { row: 'r1', key: '.', shift: '>', keycode: 190 }
    { row: 'r1', key: '/', shift: '?', keycode: 191 }
    { row: 'r1', key: 'SHIFT', css: 'w2_75', keycode: 16, special: true }

    { row: 'r0', key: 'CTRL', css: 'w1_25', keycode: 17, special: true }
    { row: 'r0', key: 'M', css: 'w1_25', keycode: 91, special: true }
    { row: 'r0', key: 'ALT', css: 'w1_25', keycode: 18, special: true }
    { row: 'r0', key: 'SPACE', css: 'space', keycode: 32, special: true }
    { row: 'r0', key: 'CTRL', css: 'w1_25', keycode: 17, special: true }
    { row: 'r0', key: 'M', css: 'w1_25', keycode: 18, special: true }
    { row: 'r0', key: 'P', css: 'w1_25', keycode: 93, special: true }
    { row: 'r0', key: 'ALT', css: 'w1_25', keycode: 18, special: true }

    # NUMPAD KEYS
    { row: 'num_r0', key: '0', keycode: 49, css: 'w2_25' }
    { row: 'num_r0', key: '.', keycode: 49 }

    { row: 'num_r1', key: '1', keycode: 49 }
    { row: 'num_r1', key: '2', keycode: 50 }
    { row: 'num_r1', key: '3', keycode: 51 }

    { row: 'num_r2', key: '4', keycode: 52 }
    { row: 'num_r2', key: '5', keycode: 53 }
    { row: 'num_r2', key: '6', keycode: 54 }

    { row: 'num_r3', key: '7', keycode: 55 }
    { row: 'num_r3', key: '8', keycode: 56 }
    { row: 'num_r3', key: '9', keycode: 57 }

    { row: 'num_r4', key: 'CLEAR', keycode: 48 }
    { row: 'num_r4', key: '/', keycode: 189 }
    { row: 'num_r4', key: '*', keycode: 187 }

    { row: 'num_col', key: '-', keycode: 48 }
    { row: 'num_col', key: '+', keycode: 189, css: 'h2_0' }
    { row: 'num_col', key: 'ENTER', keycode: 187, css: 'h2_0' }

    # Function Keys
    { row: 'func_r0', key: 'F1', keycode: 49 }
    { row: 'func_r0', key: 'F2', keycode: 50 }
    { row: 'func_r0', key: 'F3', keycode: 51 }
    { row: 'func_r0', key: 'F4', keycode: 52 }
    { row: 'func_r0', key: 'F5', keycode: 53 }
    { row: 'func_r0', key: 'F6', keycode: 54 }
    { row: 'func_r0', key: 'F7', keycode: 55 }
    { row: 'func_r0', key: 'F8', keycode: 56 }
    { row: 'func_r0', key: 'F9', keycode: 57 }
    { row: 'func_r0', key: 'F10', keycode: 57 }
    { row: 'func_r0', key: 'F11', keycode: 57 }
    { row: 'func_r0', key: 'F12', keycode: 57 }
    { row: 'func_r0', key: 'F13', keycode: 57 }

    # Media Keys
    { row: 'media_r0', key: 'F13', keycode: 57, icon: 'fa-step-backward' }
    { row: 'media_r0', key: 'F13', keycode: 57, icon: 'fa-play' }
    { row: 'media_r0', key: 'F13', keycode: 57, icon: 'fa-step-forward' }
    { row: 'media_r0', key: 'F13', keycode: 57, icon: 'fa-volume-off' }
    { row: 'media_r0', key: 'F13', keycode: 57, icon: 'fa-volume-down' }
    { row: 'media_r0', key: 'F13', keycode: 57, icon: 'fa-volume-up' }

    # Navigation Keys
    { row: 'nav_r0', key: 'PGUP', keycode: 57 }
    { row: 'nav_r0', key: 'PGDN', keycode: 57 }
    { row: 'nav_r0', key: 'END', keycode: 57 }
    { row: 'nav_r0', key: 'HOME', keycode: 57 }
    { row: 'nav_r0', key: 'LEFT-ARROW', keycode: 57, icon: 'fa-chevron-left' }
    { row: 'nav_r0', key: 'UP-ARROW', keycode: 57, icon: 'fa-chevron-up' }
    { row: 'nav_r0', key: 'DOWN-ARROW', keycode: 57, icon: 'fa-chevron-down' }
    { row: 'nav_r0', key: 'RIGHT-ARROW', keycode: 57, icon: 'fa-chevron-right' }
    { row: 'nav_r0', key: 'INS', keycode: 57 }
    { row: 'nav_r0', key: 'DEL', keycode: 57 }

]

# Scratch

# { row: 'nav_r0', key: 'LEFT-ARROW', keycode: 57, icon: 'fa-chevron-left' }
# { row: 'nav_r0', key: 'UP-ARROW', keycode: 57, icon: 'fa-chevron-up' }
# { row: 'nav_r0', key: 'DOWN-ARROW', keycode: 57, icon: 'fa-chevron-down' }
# { row: 'nav_r0', key: 'RIGHT-ARROW', keycode: 57, icon: 'fa-chevron-right' }

# { key: 'ESC', keycode: 27 }
# { key: 'F1' }
# { key: 'F2' }
# { key: 'F3' }
# { key: 'F4' }
# { key: 'F5' }
# { key: 'F6' }
# { key: 'F7' }
# { key: 'F8' }
# { key: 'F9' }
# { key: 'F10' }
# { key: 'F11' }
# { key: 'F12' }
# { key: 'P' }

# { key: 'MEDIA_PREV', icon: 'fa-backward' }
# { key: 'MEDIA_PLAY', icon: 'fa-play' }
# { key: 'MEDIA_NEXT', icon: 'fa-forward' }
# { key: 'VOL_MUTE', icon: 'fa-volume-off' }
# { key: 'VOL_DOWN', icon: 'fa-volume-down' }
# { key: 'VOL_UP', icon: 'fa-volume-up' }
