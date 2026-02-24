#!/bin/zsh
# Demo 12: Command File Live Updates
# Demonstrates the full range of command file operations:
#   title:, titlefont:, message: (including append with +), alignment:,
#   icon:, icon: size:, icon: centre/left, iconalpha:, overlayicon:,
#   button1text:, button1:, button2text:, button2:, buttonsize:,
#   infobuttontext:, infotext:, infobox:,
#   width:, height:, position:, activate:, hide:, show:,
#   blurscreen:, showdockicon:, dockicon:, dockiconbadge:, bounce:,
#   bannerimage:, bannertext:, webcontent:, video:, quit:

DIALOG="/usr/local/bin/dialog"
CMD_FILE="/var/tmp/dialog.log"

rm -f "$CMD_FILE"

# Launch the dialog
"$DIALOG" \
    --title "Command File Demo" \
    --message "This dialog will update itself in real-time using the command file.\n\nWatch as properties change!" \
    --icon "SF=terminal,colour=#007AFF" \
    --iconsize 100 \
    --progress 12 \
    --progresstext "Starting demo..." \
    --infotext "Step 0 of 12" \
    --button1text "Please watch..." \
    --button1disabled \
    --commandfile "$CMD_FILE" \
    --moveable \
    --width 700 \
    --height 450 &

DIALOG_PID=$!
sleep 1.5

# Step 1: Update title
echo "progress: 1" >> "$CMD_FILE"
echo "progresstext: Updating title..." >> "$CMD_FILE"
echo "infotext: Step 1 of 12" >> "$CMD_FILE"
echo "title: Title Changed!" >> "$CMD_FILE"
sleep 2

# Step 2: Update title font
echo "progress: 2" >> "$CMD_FILE"
echo "progresstext: Changing title font..." >> "$CMD_FILE"
echo "infotext: Step 2 of 12" >> "$CMD_FILE"
echo "titlefont: size=28 weight=light colour=#FF2D55" >> "$CMD_FILE"
sleep 2

# Step 3: Update message
echo "progress: 3" >> "$CMD_FILE"
echo "progresstext: Updating message..." >> "$CMD_FILE"
echo "infotext: Step 3 of 12" >> "$CMD_FILE"
echo "message: The message has been completely replaced!\n\nThis is a **new message** with markdown support." >> "$CMD_FILE"
sleep 2

# Step 4: Append to message
echo "progress: 4" >> "$CMD_FILE"
echo "progresstext: Appending to message..." >> "$CMD_FILE"
echo "infotext: Step 4 of 12" >> "$CMD_FILE"
echo "message: + \n\n_This line was appended using the \`+\` prefix._" >> "$CMD_FILE"
sleep 2

# Step 5: Change message alignment
echo "progress: 5" >> "$CMD_FILE"
echo "progresstext: Centering message..." >> "$CMD_FILE"
echo "infotext: Step 5 of 12" >> "$CMD_FILE"
echo "alignment: center" >> "$CMD_FILE"
sleep 2

# Step 6: Change icon
echo "progress: 6" >> "$CMD_FILE"
echo "progresstext: Changing icon..." >> "$CMD_FILE"
echo "infotext: Step 6 of 12" >> "$CMD_FILE"
echo "icon: SF=globe.americas.fill,colour=#34C759" >> "$CMD_FILE"
sleep 2

# Step 7: Add overlay icon
echo "progress: 7" >> "$CMD_FILE"
echo "progresstext: Adding overlay icon..." >> "$CMD_FILE"
echo "infotext: Step 7 of 12" >> "$CMD_FILE"
echo "overlayicon: SF=checkmark.circle.fill,colour=#FFD60A" >> "$CMD_FILE"
sleep 2

# Step 8: Change icon transparency
echo "progress: 8" >> "$CMD_FILE"
echo "progresstext: Adjusting icon alpha..." >> "$CMD_FILE"
echo "infotext: Step 8 of 12" >> "$CMD_FILE"
echo "iconalpha: 0.4" >> "$CMD_FILE"
sleep 1.5
echo "iconalpha: 1.0" >> "$CMD_FILE"
sleep 1

# Step 9: Update button text
echo "progress: 9" >> "$CMD_FILE"
echo "progresstext: Updating buttons..." >> "$CMD_FILE"
echo "infotext: Step 9 of 12" >> "$CMD_FILE"
echo "button1text: Almost done..." >> "$CMD_FILE"
echo "button2text: Still waiting" >> "$CMD_FILE"
sleep 2

# Step 10: Update info text and info box
echo "progress: 10" >> "$CMD_FILE"
echo "progresstext: Updating info areas..." >> "$CMD_FILE"
echo "infotext: Step 10 of 12 — Info text updated!" >> "$CMD_FILE"
echo "infobox: **Info Box**\n\nThis area sits below the icon.\n\nIt supports markdown!" >> "$CMD_FILE"
sleep 2

# Step 11: Centre the icon
echo "progress: 11" >> "$CMD_FILE"
echo "progresstext: Centering icon..." >> "$CMD_FILE"
echo "infotext: Step 11 of 12" >> "$CMD_FILE"
echo "icon: centre" >> "$CMD_FILE"
echo "message: The icon moved to the centre!\n\nUsing \`icon: centre\` via the command file." >> "$CMD_FILE"
echo "alignment: center" >> "$CMD_FILE"
sleep 2

# Step 12: Reset and finish
echo "progress: 12" >> "$CMD_FILE"
echo "progresstext: ✅ Demo complete!" >> "$CMD_FILE"
echo "infotext: Step 12 of 12 — Done!" >> "$CMD_FILE"
echo "icon: left" >> "$CMD_FILE"
echo "icon: SF=checkmark.seal.fill,colour=#34C759" >> "$CMD_FILE"
echo "overlayicon: none" >> "$CMD_FILE"
echo "title: Command File Demo Complete" >> "$CMD_FILE"
echo "titlefont: size=24 weight=bold colour=#34C759" >> "$CMD_FILE"
echo "message: All command file operations demonstrated!\n\nThe command file supports dozens of real-time update commands." >> "$CMD_FILE"
echo "alignment: left" >> "$CMD_FILE"
echo "button1text: Done ✓" >> "$CMD_FILE"
echo "button1: enable" >> "$CMD_FILE"
sleep 1

wait $DIALOG_PID 2>/dev/null || true
rm -f "$CMD_FILE"
