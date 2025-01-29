Not yet implemented:

### Universal:

| Key    | Action              | Done |
| ------ | ------------------- | ---- |
| C-n    | File Tree           | done |
| C-hjkl | Move between splits | done |
| C-HJKL | Resize split        |      |

### Normal Mode:

| Key       | Action                         | Done |
| --------- | ------------------------------ | ---- |
| Tab/S-Tab | Move Between Buffers           | done |
| C-+       | Increment number               | done |
| C--       | Decrement number               | done |
| q:        | Unbind. Cmd hist will be moved | done |
| K         | Show Documentation             | done |

### Normal Mode after leader key

| Key | Action                      | Done |
| --- | --------------------------- | ---- |
| SPC | find/open file              | done |
| ?   | Open Keymap Helper          | done |
| +b  | Buffer group                | -    |
| bo  | New Buffer                  | done |
| bl  | List buffers (telescope)    | done |
| bx  | Close Buffer                | done |
| +c  | Code group                  | -    |
| ca  | Code Action                 | done |
| cf  | Format                      | done |
| cF  | Toggle auto format          | done |
| cr  | Rename (LSP)                | done |
| +d  | Diagnostics Group           | -    |
| dl  | LSP Diagnostics             | done |
| +f  | Find/Files Group            | -    |
| fe  | File tree                   | done |
| ff  | Find files                  | done |
| fg  | Find text globally          | done |
| fn  | New File                    | done |
| fw  | Save file (:w)              | done |
| +g  | Go to Group                 | -    |
| gd  | Go to definition            | done |
| gD  | Go to declaration           | done |
| gi  | Go to implementation        | done |
| gr  | Go to references            | done |
| gt  | Go to type definition       | done |
| +m  | Misc Group                  | -    |
| m+  | Increment number            | done |
| m-  | Decrement number            | done |
| mc  | Clear Search                | done |
| mh  | Command history (telescope) | done |
| mt  | Terminal                    | done |
| +n  | Notifications group         | -    |
| nd  | Dismiss notif               | done |
| nD  | Toggle noice.nvim           | done |
| nh  | Notif history (telescope)   |      |
| nl  | Last notif                  | done |
| o   | Outline                     | done |
| +q  | Quit/Session Group          | -    |
| qs  | Save Session                | done |
| qr  | Restore Session             | done |
| qq  | Save all and quit           | done |
| +s  | Split group                 | -    |
| se  | Make splits equal size      | done |
| sh  | Horizontal split            | done |
| sm  | Maximize split              | done |
| sv  | Vertical split              | done |
| sx  | Close split                 | done |
| +v  | VCS                         | -    |
| vb  | Git blame                   | done |
| vg  | Git graph                   | done |

### Insert Mode

| Key | Action    | Done |
| --- | --------- | ---- |
| jk  | Exit mode | done |

### Visual Mode

| Key | Action           | Done |
| --- | ---------------- | ---- |
| +s  | Surround group   | -    |
| s"  | Surround with "" | done |
| s'  | Surround with '' | done |
| s<  | Surround with <> | done |
| s(  | Surround with () | done |
| s[  | Surround with [] | done |
| s{  | Surround with {} | done |

### Still needed

- Hide auto complete popup

### Colors

- green: open/increment
- red: close/decrement
- yellow: toggle
- purple: go to
- blue: everything else
