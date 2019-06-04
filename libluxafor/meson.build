deps = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('libusb-1.0')
]

lib_sources = files(
    'device/effect/color.vala',
    'device/effect/effect.vala',
    'device/effect/error.vala',
    'device/effect/fade_to_color.vala',
    'device/effect/random_color.vala',
    'device/effect/raw.vala',
    'device/effect/shutdown.vala',
    'device/finder/error.vala',
    'device/finder/luxafor_finder.vala',
    'device/finder/usb_device_finder.vala',
    'device/error.vala',
    'device/luxafor.vala'
)

lib_dir = include_directories('.')
libluxafor = shared_library('luxafor', lib_sources, dependencies: deps)