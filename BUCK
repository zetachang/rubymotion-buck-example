include_defs('//buck-motion/DEFS')

apple_binary(
  name = 'DemoAppBinary',
  deps = [':AppLib'],
  linker_flags = [
    '-lobjc', '-licucore',
  ],
  frameworks = [
    '$SDKROOT/System/Library/Frameworks/UIKit.framework',
    '$SDKROOT/System/Library/Frameworks/Foundation.framework',
  ],
)

apple_resource(
  name = 'DemoAppResources',
  files = glob(['resources/*.png']),
  dirs = [],
)

apple_bundle(
  name = 'DemoApp',
  deps = [':DemoAppResources'],
  binary = ':DemoAppBinary',
  extension = 'app',
  info_plist = 'Info.plist',
)

ruby_library(
    name='AppLib',
    srcs=glob(['app/*.rb']),
)
