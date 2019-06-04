deps = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('libusb-1.0')
]

cli_sources = files(
    'luxafor.vala',
    'command/color.vala',
    'command/fade_to_color.vala',
    'command/command.vala',
    'command/random_color.vala',
    'command/raw.vala',
    'command/commands.vala',
    'command/shutdown.vala'
)

executable('luxafor', cli_sources, dependencies: deps, link_with: libluxafor, include_directories: lib_dir)