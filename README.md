# logikey
Using a secondary keyboard for input on Linux (a keypad, in this example), i.e. for Home Assistant triggers, without disturbing your X session.

This is all a HOWTO, very much inspired by the acquisition of a LogiLink keypad, and the urge to hang it on my wall and control Home Assistant.

It is all examples, and something that should make you "roll your own", so please read on.

Before you begin, i really urge you to read [this page](https://cgarethc.medium.com/adding-a-two-button-keyboard-to-my-up-cycled-raspberry-pi-photo-frame-ffda59fb979b).

My Logilink device has an USB receiver, so given that i hardly have any thought of plugging it into a different USB port, here is a good udev rule:

`KERNEL=="hidraw[0-9]", KERNELS=="1-4:1.0", SYMLINK+="logilink", MODE="0666"`

Hence, the reference to /dev/logilink in the source.

Now, speaking of source, if you do not feel like installing FreePascal just to compile a few lines of code, you can basically write your own, as long as it returns an ASCII representation of a key or scan code. That is seriously what logikey.pp does - wait for the last key to be released and return that value.

Seriously, this is not production code at all, this is inspiration to roll your own, and the whole logilink script should be considered as that.

The sample script uses a few files located in ~/.logilink -

- ~/.logilink/hasstoken is the contents of a Home Assistant token
- ~/.logilink/kodisecret is the authentication for Kodi in user:pass format, i.e. yodude:howsitgoing
- ~/.logilink/mpdsecret is the MPD password, i.e. letmein

(Make sure to chmod 400 all of those!)

Most important, ~/.logilink/device is what that article above taught you (you did read it, right?).

You can always file a bug here, as long as you keep in mind this is a tutorial, not something to just deploy.

