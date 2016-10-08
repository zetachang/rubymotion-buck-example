# Build RubyMotion App with Buck

This is an experimental _playground_ to build RubyMotion app using Buck, currently only iOS is supported.

## Why Buck?

[Buck](https://buckbuild.com) is a build tool created by Facebook to deliver fast & reproducible results.

For further detail, see [What Makes Buck so Fast?](https://buckbuild.com/concept/what_makes_buck_so_fast.html)

## But why use Buck to build RubyMotion App?

Actually the original RubyMotion toolchain for iOS is fast enough, for a small demo app like this one, Buck is only slightly faster. However, it's supposed to scale on larger code base, so the next step might be transferring an existing RM to use Buck as a comparison.

Also, this won't be possible without the [open sourced RubyMotion toolchain](https://github.com/HipByte/RubyMotion)

## Usage

1. Clone the project
2. Install [Buck](https://buckbuild.com/setup/install.html) & [RubyMotion](http://www.rubymotion.com/download/)
3. `buck build //:DemoApp` to build the app
4. `buck install --run //:DemoApp` to run inside simulator
5. `rake build:simulator` will use the default toolchain of RM.

## Limitation

This is rather a hack built up in one night to be as a proof of concept.

* Only iOS is supported now.
* Only iPhoneSimulator is tested.
* RubyMotion build config is far more complex, so lots of cased are not considered.

## How can I hack on the project?

Actually all of the magic is inside **buck-motion** folder. To use in other project, simply copy this folder to your project root and start hacking.

## Contact

[David Chang](http://github.com/zetachang)
[@zetachang](https://twitter.com/zetachang)

## License

MIT License, See **LICENSE** file for details.
