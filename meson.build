project('luxacode', 'vala', 'c')

deps = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('libusb-1.0')
]

lib_sources = files(
    'libluxafor/Device/effect/color.vala',
    'libluxafor/Device/effect/effect.vala',
    'libluxafor/Device/effect/error.vala',
    'libluxafor/Device/effect/fade_to_color.vala',
    'libluxafor/Device/effect/random_color.vala',
    'libluxafor/Device/effect/raw.vala',
    'libluxafor/Device/effect/shutdown.vala',
    'libluxafor/Device/finder/error.vala',
    'libluxafor/Device/finder/luxafor_finder.vala',
    'libluxafor/Device/finder/usb_device_finder.vala',
    'libluxafor/Device/error.vala',
    'libluxafor/Device/luxafor.vala'
)

cli_sources = files(
    'luxafor-cli/luxafor.vala',
    'luxafor-cli/option/color.vala',
    'luxafor-cli/option/fade_to_color.vala',
    'luxafor-cli/option/option.vala',
    'luxafor-cli/option/random_color.vala',
    'luxafor-cli/option/raw.vala',
    'luxafor-cli/option/register_stack.vala',
    'luxafor-cli/option/shutdown.vala'
)

libluxafor = shared_library('luxafor', lib_sources, dependencies: deps)
executable('luxafor', cli_sources, dependencies: deps, link_with: libluxafor)