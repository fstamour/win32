;;;Copyright (c) 2013 Wilfredo Velázquez-Rodríguez
;;;
;;;This software is provided 'as-is', without any express or implied
;;;warranty. In no event will the authors be held liable for any damages
;;;arising from the use of this software.
;;;
;;;Permission is granted to anyone to use this software for any purpose,
;;;including commercial applications, and to alter it and redistribute
;;;it freely, subject to the following restrictions:
;;;
;;;1. The origin of this software must not be misrepresented; you must not
;;;   claim that you wrote the original software. If you use this software
;;;   in a product, an acknowledgment in the product documentation would
;;;   be appreciated but is not required.
;;;
;;;2. Altered source versions must be plainly marked as such, and must not
;;;   be misrepresented as being the original software.
;;;
;;;3. This notice may not be removed or altered from any source distribution.

(cl:in-package #:cl-user)

(defpackage #:win32
  (:use #:cl)
  (:export
   
   #:+win32-string-encoding+
   
   #:+pfd-type-rgba+
   #:+pfd-type-colorindex+
   
   #:+pfd-main-plane+
   #:+pfd-overlay-plane+
   #:+pfd-underlay-plane+
   
   #:+pfd-doublebuffer+
   #:+pfd-stereo+
   #:+pfd-draw-to-window+
   #:+pfd-draw-to-bitmap+
   #:+pfd-support-gdi+
   #:+pfd-support-opengl+
   #:+pfd-generic-format+
   #:+pfd-need-palette+
   #:+pfd-need-system-palette+
   #:+pfd-swap-exchange+
   #:+pfd-swap-copy+
   #:+pfd-swap-layer-buffers+
   #:+pfd-generic-accelerated+
   #:+pfd-support-directdraw+
   #:+pfd-direct3d-accelerated+
   #:+pfd-support-composition+
   #:+pfd-depth-dontcare+
   #:+pfd-doublebuffer-dontcare+
   #:+pfd-stereo-dontcare+
   
   ;;Window Styles
   #:+ws-overlapped+
   #:+ws-popup+
   #:+ws-child+
   #:+ws-visible+
   #:+ws-caption+
   #:+ws-border+
   #:+ws-tabstop+
   #:+ws-maximizebox+
   #:+ws-minimizebox+
   #:+ws-thickframe+
   #:+ws-sysmenu+
   #:+ws-overlappedwindow+

   ;;Window ex styles
   #:+ws-ex-windowedge+
   #:+ws-ex-appwindow+

   ;;Edit control types
   #:+es-left+
   #:+es-center+
   #:+es-right+

   #:+wm-null+
   #:+wm-create+
   #:+wm-destroy+
   #:+wm-move+
   #:+wm-size+
   #:+wm-activate+
   #:+wm-setfocus+
   #:+wm-killfocus+
   #:+wm-enable+
   #:+wm-setredraw+
   #:+wm-settext+
   #:+wm-gettext+
   #:+wm-gettextlength+
   #:+wm-paint+
   #:+wm-close+
   #:+wm-queryendsession+
   #:+wm-quit+
   #:+wm-queryopen+
   #:+wm-erasebkgnd+
   #:+wm-syscolorchange+
   #:+wm-endsession+
   #:+wm-systemerror+
   #:+wm-showwindow+
   #:+wm-ctlcolor+
   #:+wm-wininichange+
   #:+wm-settingchange+
   #:+wm-devmodechange+
   #:+wm-activateapp+
   #:+wm-fontchange+
   #:+wm-timechange+
   #:+wm-cancelmode+
   #:+wm-setcursor+
   #:+wm-mouseactivate+
   #:+wm-childactivate+
   #:+wm-queuesync+
   #:+wm-getminmaxinfo+
   #:+wm-painticon+
   #:+wm-iconerasebkgnd+
   #:+wm-nextdlgctl+
   #:+wm-spoolerstatus+
   #:+wm-drawitem+
   #:+wm-measureitem+
   #:+wm-deleteitem+
   #:+wm-vkeytoitem+
   #:+wm-chartoitem+
   #:+wm-setfont+
   #:+wm-getfont+
   #:+wm-sethotkey+
   #:+wm-gethotkey+
   #:+wm-querydragicon+
   #:+wm-compareitem+
   #:+wm-compacting+
   #:+wm-windowposchanging+
   #:+wm-windowposchanged+
   #:+wm-power+
   #:+wm-copydata+
   #:+wm-canceljournal+
   #:+wm-notify+
   #:+wm-inputlangchangerequest+
   #:+wm-inputlangchange+
   #:+wm-tcard+
   #:+wm-help+
   #:+wm-userchanged+
   #:+wm-notifyformat+
   #:+wm-contextmenu+
   #:+wm-stylechanging+
   #:+wm-stylechanged+
   #:+wm-displaychange+
   #:+wm-geticon+
   #:+wm-seticon+
   #:+wm-nccreate+
   #:+wm-ncdestroy+
   #:+wm-nccalcsize+
   #:+wm-nchittest+
   #:+wm-ncpaint+
   #:+wm-ncactivate+
   #:+wm-getdlgcode+
   #:+wm-syncpaint+
   #:+wm-ncmousemove+
   #:+wm-nclbuttondown+
   #:+wm-nclbuttonup+
   #:+wm-nclbuttondblclk+
   #:+wm-ncrbuttondown+
   #:+wm-ncrbuttonup+
   #:+wm-ncrbuttondblclk+
   #:+wm-ncmbuttondown+
   #:+wm-ncmbuttonup+
   #:+wm-ncmbuttondblclk+
   #:+wm-keyfirst+
   #:+wm-keydown+
   #:+wm-keyup+
   #:+wm-char+
   #:+wm-deadchar+
   #:+wm-syskeydown+
   #:+wm-syskeyup+
   #:+wm-syschar+
   #:+wm-sysdeadchar+
   #:+wm-keylast+
   #:+wm-ime_startcomposition+
   #:+wm-ime_endcomposition+
   #:+wm-ime_composition+
   #:+wm-ime_keylast+
   #:+wm-initdialog+
   #:+wm-command+
   #:+wm-syscommand+
   #:+wm-timer+
   #:+wm-hscroll+
   #:+wm-vscroll+
   #:+wm-initmenu+
   #:+wm-initmenupopup+
   #:+wm-menuselect+
   #:+wm-menuchar+
   #:+wm-enteridle+
   #:+wm-ctlcolormsgbox+
   #:+wm-ctlcoloredit+
   #:+wm-ctlcolorlistbox+
   #:+wm-ctlcolorbtn+
   #:+wm-ctlcolordlg+
   #:+wm-ctlcolorscrollbar+
   #:+wm-ctlcolorstatic+
   #:+wm-mousefirst+
   #:+wm-mousemove+
   #:+wm-lbuttondown+
   #:+wm-lbuttonup+
   #:+wm-lbuttondblclk+
   #:+wm-rbuttondown+
   #:+wm-rbuttonup+
   #:+wm-rbuttondblclk+
   #:+wm-mbuttondown+
   #:+wm-mbuttonup+
   #:+wm-mbuttondblclk+
   #:+wm-mousewheel+
   #:+wm-mousehwheel+
   #:+wm-parentnotify+
   #:+wm-entermenuloop+
   #:+wm-exitmenuloop+
   #:+wm-nextmenu+
   #:+wm-sizing+
   #:+wm-capturechanged+
   #:+wm-moving+
   #:+wm-powerbroadcast+
   #:+wm-devicechange+
   #:+wm-mdicreate+
   #:+wm-mdidestroy+
   #:+wm-mdiactivate+
   #:+wm-mdirestore+
   #:+wm-mdinext+
   #:+wm-mdimaximize+
   #:+wm-mditile+
   #:+wm-mdicascade+
   #:+wm-mdiiconarrange+
   #:+wm-mdigetactive+
   #:+wm-mdisetmenu+
   #:+wm-entersizemove+
   #:+wm-exitsizemove+
   #:+wm-dropfiles+
   #:+wm-mdirefreshmenu+
   #:+wm-ime-setcontext+
   #:+wm-ime-notify+
   #:+wm-ime-control+
   #:+wm-ime-compositionfull+
   #:+wm-ime-select+
   #:+wm-ime-char+
   #:+wm-ime-keydown+
   #:+wm-ime-keyup+
   #:+wm-mousehover+
   #:+wm-ncmouseleave+
   #:+wm-mouseleave+
   #:+wm-cut+
   #:+wm-copy+
   #:+wm-paste+
   #:+wm-clear+
   #:+wm-undo+
   #:+wm-renderformat+
   #:+wm-renderallformats+
   #:+wm-destroyclipboard+
   #:+wm-drawclipboard+
   #:+wm-paintclipboard+
   #:+wm-vscrollclipboard+
   #:+wm-sizeclipboard+
   #:+wm-askcbformatname+
   #:+wm-changecbchain+
   #:+wm-hscrollclipboard+
   #:+wm-querynewpalette+
   #:+wm-paletteischanging+
   #:+wm-palettechanged+
   #:+wm-hotkey+
   #:+wm-print+
   #:+wm-printclient+
   #:+wm-handheldfirst+
   #:+wm-handheldlast+
   #:+wm-penwinfirst+
   #:+wm-penwinlast+
   #:+wm-coalesce_first+
   #:+wm-coalesce_last+
   #:+wm-dde-first+
   #:+wm-dde-initiate+
   #:+wm-dde-terminate+
   #:+wm-dde-advise+
   #:+wm-dde-unadvise+
   #:+wm-dde-ack+
   #:+wm-dde-data+
   #:+wm-dde-request+
   #:+wm-dde-poke+
   #:+wm-dde-execute+
   #:+wm-dde-last+
   #:+wm-user+
   #:+wm-app+
   
   #:+time-cancel+
   #:+time-hover+
   #:+time-leave+
   #:+time-nonclient+
   #:+time-query+
   
   #:+cw-usedefault+

   #:+cs-vredraw+
   #:+cs-hredraw+
   #:+cs-owndc+

   #:+sw-show+

   #:+idi-application+
   #:+idc-arrow+

   #:+white-brush+
   #:+black-brush+
   #:+dc-brush+

   #:+gcl-hbrbackground+
   #:+gcl-wndproc+
   #:+gcw-atom+
   
   #:+gwl-wndproc+
   #:+gwl-id+
   #:+gwl-style+
   #:+gwl-userdata+

   #:+swp-nosize+
   #:+swp-nomove+
   #:+swp-nozorder+
   #:+swp-noactivate+
   #:+swp-showwindow+
   #:+swp-hidewindow+
   #:+swp-noownerzorder+
   #:+swp-noreposition+

   #:+infinite+

   #:+wait-object-0+
   #:+wait-abandoned+
   #:+wait-timeout+
   #:+wait-failed+
   
   #:+hwnd-top+
   #:+hwnd-bottom+
   #:+hwnd-message+
   #:+hwnd-notopmost+
   #:+hwnd-topmost+

   #:+winevent-outofcontext+
   #:+winevent-skipownthread+
   #:+winevent-skipownprocess+
   #:+winevent-incontext+
   
   #:+wh-mouse+
   #:+wh-mouse-ll+   
   
   #:+delete+
   #:+read-control+
   #:+write-dac+
   #:+write-owner+
   #:+synchronize+

   #:+standard-rights-required+

   #:+standard-rights-read+
   #:+standard-rights-write+
   #:+standard-rights-execute+

   #:+standard-rights-all+
   #:+specific-rights-all+

   #:+desktop-createmenu+
   #:+desktop-createwindow+
   #:+desktop-enumerate+
   #:+desktop-hookcontrol+
   #:+desktop-journalplayback+
   #:+desktop-journalrecord+
   #:+desktop-readobjects+
   #:+desktop-switchdesktop+
   #:+desktop-writeobjects+

   #:+generic-read+
   #:+generic-write+
   #:+generic-execute+
   #:+generic-all+
   
   #:logpalette
   #:paletteentry
   #:paintstruct
   #:pixelformatdescriptor
   #:point
   #:rect
   #:trackmouseevent
   #:wndclass
   #:wndclassex
   #:msg
   #:createstruct
   
   #:dc
   #:erase
   #:paint
   #:restore
   #:incupdate
   #:rgbreserved
   
   #:num-entries
   #:palette-entries
   
   #:red
   #:green
   #:blue
   
   #:x
   #:y
   
   #:left
   #:top
   #:right
   #:bottom
   
   #:cbsize
   #:flags
   #:hwnd
   #:hover-time
   #:style
   #:wndproc
   #:clsextra
   #:wndextra
   #:instance
   #:icon
   #:cursor
   #:background
   #:menu-name
   #:wndclass-name
   #:iconsm
      
   #:size
   #:version
   #:pixel-type
   #:color-bits
   #:red-bits
   #:red-shift
   #:green-bits
   #:green-shift
   #:blue-bits
   #:blue-shift
   #:alpha-bits
   #:alpha-shift
   #:accum-bits
   #:accum-red-bits
   #:accum-green-bits
   #:accum-blue-bits
   #:accum-alpha-bits
   #:depth-bits
   #:stencil-bits
   #:aux-buffers
   #:layer-type
   #:reserved
   #:layer-mask
   #:visible-mask
   #:damage-mask
   
   #:message
   #:wparam
   #:lparam
   #:time
   
   #:create-params
   #:instance
   #:menu
   #:parent
   #:cy
   #:cx
   #:name
   #:class
   #:exstyle
   
   #:beep
   #:begin-paint
   #:choose-pixel-format
   #:client-to-screen
   #:clip-cursor
   #:create-palette
   #:describe-pixel-format
   #:destroy-cursor
   #:end-paint
   #:find-window
   #:get-class-long
   #:get-class-long-ptr
   #:get-class-word
   #:get-client-rect
   #:get-command-line
   #:get-current-process
   #:get-current-process-id
   #:get-current-processor-number
   #:get-dc
   #:get-desktop-window
   #:get-shell-window
   #:get-pixel-format
   #:get-parent
   #:get-top-window
   #:get-window-text
   #:invalidate-rect
   #:is-gui-thread
   #:is-window
   #:realize-palette
   #:register-class
   #:register-class-ex
   #:release-dc
   #:resize-palette
   #:show-cursor
   #:select-palette
   #:set-class-long
   #:set-class-long-ptr
   #:set-class-word
   #:set-cursor
   #:set-cursor-pos
   #:set-foreground-window
   #:set-parent
   #:set-pixel-format
   #:set-window-text
   #:swap-buffers
   #:track-mouse-event
   #:unregister-class
   #:validate-rect
   #:def-window-proc
   #:get-module-handle
   #:load-icon
   #:load-cursor
   #:load-cursor-from-file
   #:get-stock-object
   #:create-window-ex
   #:show-window
   #:enum-windows
   #:update-window
   #:get-message
   #:peek-message
   #:post-quit-message
   #:post-thread-message
   #:translate-message
   #:dispatch-message
   #:close-window
   #:destroy-window
   #:get-last-error
   #:set-window-long
   #:get-window-long
   #:set-window-pos
   #:get-window-rect
   #:delete-object
   #:post-message
   #:get-current-thread-id
   #:set-windows-hook-ex
   #:set-layered-window-attributes
   #:call-next-hook
   #:set-win-event-hook
   #:get-window-thread-process-id
   #:window-from-point
   #:create-event
   #:create-semaphore
   #:open-event
   #:wait-for-single-object
   #:wgl-create-context
   #:wgl-delete-context
   #:wgl-make-current
   #:set-event
   #:reset-event
   #:close-handle
   #:create-mutex
   #:create-desktop
   #:switch-desktop
   #:open-input-desktop
   #:memset))

(cl:in-package #:win32)
