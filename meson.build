project('luxacode', 'vala', 'c')

deps = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('libusb-1.0')
]

lib_sources = files(
    'libluxafor/device/effect/color.vala',
    'libluxafor/device/effect/effect.vala',
    'libluxafor/device/effect/error.vala',
    'libluxafor/device/effect/fade_to_color.vala',
    'libluxafor/device/effect/random_color.vala',
    'libluxafor/device/effect/raw.vala',
    'libluxafor/device/effect/shutdown.vala',
    'libluxafor/device/finder/error.vala',
    'libluxafor/device/finder/luxafor_finder.vala',
    'libluxafor/device/finder/usb_device_finder.vala',
    'libluxafor/device/error.vala',
    'libluxafor/device/luxafor.vala'
)

cli_sources = files(
    'cli/luxafor.vala',
    'cli/option/color.vala',
    'cli/option/fade_to_color.vala',
    'cli/option/option.vala',
    'cli/option/random_color.vala',
    'cli/option/raw.vala',
    'cli/option/register_stack.vala',
    'cli/option/shutdown.vala'
)

libluxafor = shared_library('luxafor', lib_sources, dependencies: deps)
executable('luxafor', cli_sources, dependencies: deps, link_with: libluxafor)