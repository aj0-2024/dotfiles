import vim
import re
from string import Template
import parser

template = Template("""
IconButton.iconButton
    (IconButton.config
        |> IconButton.setOnClick ($on_click)
    )
    (IconButton.icon "$icon")
""")



def parse_content(content):
    config = {
        "on_click": None,
        "icon": None
    }

    # get the onclick handler
    match = re.search("Options.onClick ([\w\s()]+)", content)
    if match:
        config["on_click"] = match.groups()[0]

    # get the button label
    match = re.search('Icon.i "([\w]+)"', content)
    if match:
        config["icon"] = match.groups()[0]

    return config

def to_mdc_icon_button():

    # set cursor to beginning of the button
    vim.command("norm ^")
    vim.command("norm w")

    content, start, end = parser.get_content()
    config = parse_content(content)

    # clear content
    buffer = vim.current.buffer
    vim.command("norm c$")
    del buffer[start:end+1]

    new_content = template.substitute(config)

    buffer.append(new_content.splitlines(), start)
    vim.command("ElmFormat")

