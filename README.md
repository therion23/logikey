# logikey
Using a secondary keyboard for input on Linux, i.e. for Home Assistant triggers, without disturbing your X session.

This is all a HOWTO, very much inspired by the acquisition of a LogiLink keypad, and the urge to hang it on my wall and control Home Assistant.

It is all examples, and something that should make you "roll your own", so please read on.

Before you begin, i really urge you to read [this page](https://cgarethc.medium.com/adding-a-two-button-keyboard-to-my-up-cycled-raspberry-pi-photo-frame-ffda59fb979b)

My Logilink device has an USB receiver, so given that i hardly have any thought of plugging it into a different USB port, here is a good udev rule:

`KERNEL=="hidraw[0-9]", KERNELS=="1-4:1.0", SYMLINK+="logilink", MODE="0666"`

