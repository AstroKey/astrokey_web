
# Key JSON definitions
module.exports = [
    { row: 'r4', key: '`', shift_key: '~', keycode: 192 }
    { row: 'r4', key: '1', shift_key: '!', keycode: 49 }
    { row: 'r4', key: '2', shift_key: '@', keycode: 50 }
    { row: 'r4', key: '3', shift_key: '#', keycode: 51 }
    { row: 'r4', key: '4', shift_key: '$', keycode: 52 }
    { row: 'r4', key: '5', shift_key: '%', keycode: 53 }
    { row: 'r4', key: '6', shift_key: '^', keycode: 54 }
    { row: 'r4', key: '7', shift_key: '&', keycode: 55 }
    { row: 'r4', key: '8', shift_key: '*', keycode: 56 }
    { row: 'r4', key: '9', shift_key: '(', keycode: 57 }
    { row: 'r4', key: '0', shift_key: ')', keycode: 48 }
    { row: 'r4', key: '-', shift_key: '_', keycode: 189 }
    { row: 'r4', key: '=', shift_key: '+', keycode: 187 }
    { row: 'r4', key: 'BACKSPACE', keycode: 8, css: 'w2_0' }

    { row: 'r3', key: 'TAB', keycode: 9, css: 'w1_5', special: true }
    { row: 'r3', key: 'q', shift_key: 'Q', alpha: true, keycode: 81 }
    { row: 'r3', key: 'w', shift_key: 'W', alpha: true, keycode: 87 }
    { row: 'r3', key: 'e', shift_key: 'E', alpha: true, keycode: 69 }
    { row: 'r3', key: 'r', shift_key: 'R', alpha: true, keycode: 82 }
    { row: 'r3', key: 't', shift_key: 'T', alpha: true, keycode: 84 }
    { row: 'r3', key: 'y', shift_key: 'Y', alpha: true, keycode: 89 }
    { row: 'r3', key: 'u', shift_key: 'U', alpha: true, keycode: 85 }
    { row: 'r3', key: 'i', shift_key: 'I', alpha: true, keycode: 73 }
    { row: 'r3', key: 'o', shift_key: 'O', alpha: true, keycode: 79 }
    { row: 'r3', key: 'p', shift_key: 'P', alpha: true, keycode: 80 }
    { row: 'r3', key: '[', shift_key: '{', keycode: 219 }
    { row: 'r3', key: ']', shift_key: '}', keycode: 221 }
    { row: 'r3', key: '\\', shift_key: '|', keycode: 220, css: 'w1_5' }

    { row: 'r2', key: 'CAPS', css: 'w1_75', keycode: 20, special: true }
    { row: 'r2', key: 'a', shift_key: 'A', alpha: true, keycode: 65 }
    { row: 'r2', key: 's', shift_key: 'S', alpha: true, keycode: 83 }
    { row: 'r2', key: 'd', shift_key: 'D', alpha: true, keycode: 68 }
    { row: 'r2', key: 'f', shift_key: 'F', alpha: true, keycode: 70 }
    { row: 'r2', key: 'g', shift_key: 'G', alpha: true, keycode: 71 }
    { row: 'r2', key: 'h', shift_key: 'H', alpha: true, keycode: 72 }
    { row: 'r2', key: 'j', shift_key: 'J', alpha: true, keycode: 74 }
    { row: 'r2', key: 'k', shift_key: 'K', alpha: true, keycode: 75 }
    { row: 'r2', key: 'l', shift_key: 'L', alpha: true, keycode: 76 }
    { row: 'r2', key: ';', shift_key: ':', keycode: 186 }
    { row: 'r2', key: "'", shift_key: '"', keycode: 222 }
    { row: 'r2', key: 'RETURN', css: 'w2_25', keycode: 13, special: true }

    { row: 'r1', key: 'SHIFT', css: 'w2_25', keycode: 16, special: true }
    { row: 'r1', key: 'z', shift_key: 'Z', alpha: true, keycode: 90 }
    { row: 'r1', key: 'x', shift_key: 'X', alpha: true, keycode: 88 }
    { row: 'r1', key: 'c', shift_key: 'C', alpha: true, keycode: 67 }
    { row: 'r1', key: 'v', shift_key: 'V', alpha: true, keycode: 86 }
    { row: 'r1', key: 'b', shift_key: 'B', alpha: true, keycode: 66 }
    { row: 'r1', key: 'n', shift_key: 'N', alpha: true, keycode: 78 }
    { row: 'r1', key: 'm', shift_key: 'M', alpha: true, keycode: 77 }
    { row: 'r1', key: ',', shift_key: '<', keycode: 188 }
    { row: 'r1', key: '.', shift_key: '>', keycode: 190 }
    { row: 'r1', key: '/', shift_key: '?', keycode: 191 }
    { row: 'r1', key: 'SHIFT', css: 'w2_75', keycode: 16, special: true }

    { row: 'r0', key: 'CTRL', css: 'w1_25', keycode: 17, special: true }
    { row: 'r0', key: 'META', css: 'w1_25', keycode: 91, special: true }
    { row: 'r0', key: 'ALT', css: 'w1_25', keycode: 18, special: true }
    { row: 'r0', key: 'SPACE', css: 'space', keycode: 32, special: true }
    { row: 'r0', key: 'CTRL', css: 'w1_25', keycode: 17, special: true }
    { row: 'r0', key: 'M', css: 'w1_25', keycode: 18, special: true }
    { row: 'r0', key: 'P', css: 'w1_25', keycode: 93, special: true }
    { row: 'r0', key: 'ALT', css: 'w1_25', keycode: 18, special: true }

    # NUMPAD
    { row: 'num_r4', key: 'n_CLEAR', keycode: 83 }
    { row: 'num_r4', key: 'n_/', keycode: 84 }
    { row: 'num_r4', key: 'n_*', keycode: 85 }

    { row: 'num_col', key: 'n_-', keycode: 86 }
    { row: 'num_col', key: 'n_+', keycode: 87, css: 'h2_0' }
    { row: 'num_col', key: 'n_ENTER', keycode: 88, css: 'h2_0' }

    { row: 'num_r1', key: 'n_1', keycode: 89 }
    { row: 'num_r1', key: 'n_2', keycode: 90 }
    { row: 'num_r1', key: 'n_3', keycode: 91 }

    { row: 'num_r2', key: 'n_4', keycode: 92 }
    { row: 'num_r2', key: 'n_5', keycode: 93 }
    { row: 'num_r2', key: 'n_6', keycode: 94 }

    { row: 'num_r3', key: 'n_7', keycode: 95 }
    { row: 'num_r3', key: 'n_8', keycode: 96 }
    { row: 'num_r3', key: 'n_9', keycode: 97 }

    { row: 'num_r0', key: 'n_0', keycode: 98 }
    { row: 'num_r0', key: 'n_.', keycode: 99 }

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
    { row: 'media_r0', key: 'MUTE', keycode: 127, icon: 'fa-volume-off' }
    { row: 'media_r0', key: 'VOLUME_DN', keycode: 128, icon: 'fa-volume-down' }
    { row: 'media_r0', key: 'VOLUME_UP', keycode: 129, icon: 'fa-volume-up' }

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
    { row: 'nav_r0', key: 'DEL', keycode: 46 }

    # SPECIAL
    { row: 'special_r0', key: 'CUT', keycode: 1000 }
    { row: 'special_r0', key: 'COPY', keycode: 1001 }
    { row: 'special_r0', key: 'PASTE', keycode: 1002 }
    { row: 'special_r0', key: 'DELAY', keycode: 1004 }

]

