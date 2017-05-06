#!/bin/sh

DISPLAY=:0
XKBDIR=/tmp/xkb
[ -d ${XKBDIR}/symbols ] || mkdir -p ${XKBDIR}/{keymap,symbols}

cat > $XKBDIR/keymap/custom.xkb << EOF
xkb_keymap {
	xkb_keycodes  { include "evdev+aliases(qwerty)"	};
	xkb_types     { include "complete" };
	xkb_compat    { include "complete" };
	xkb_symbols   { include "pc+us+inet(evdev)+custom(hypers)" };
	xkb_geometry  { include "kinesis" };
};
EOF

cat > $XKBDIR/symbols/custom << EOF
default partial
xkb_symbols "hypers" {
    key <BKSL> { [ Hyper_R, Hyper_R ] };
    key <AB10> { [ Hyper_L, Hyper_L ] };
    key <I253> { [ backslash, bar ] };
    key <I252> { [ slash, question ] };
    modifier_map Mod4 { Super_L, Super_R, Hyper_L, Hyper_R };
};
EOF

xkbcomp -synch -w3 -I$XKBDIR $XKBDIR/keymap/custom.xkb $DISPLAY &>/dev/null
(exec killall -q xcape)
