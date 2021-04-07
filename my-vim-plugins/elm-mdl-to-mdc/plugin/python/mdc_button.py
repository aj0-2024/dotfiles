import vim
import re
from string import Template
import parser

template = Template("""
Button.$button_type
    (Button.config
        |> Button.setOnClick $on_click
    )
    "$button_label"
""")


def parse_content(content):
    config = {
        "button_type": "outlined",
        "on_click": None,
        "button_label": None
    }

    # find if button is raised
    if re.search("Options.raised", content):
        config["button_type"] = "raised"

    # get the onclick handler
    match = re.search("Options.onClick (\w+)", content)
    if match:
        config["on_click"] = match.groups()[0]

    # get the button label
    match = re.search('Html.text ([\w\s"()]+)|text ([\w\s"()]+)', content)
    if match:
        config["button_label"] = match.groups()[0]

    return config


def to_mdc_button():

    # set cursor to beginning of the button
    vim.command("norm ^")
    vim.command("norm w")

    content, start, end = parser.get_content()
    config = parse_content(content)

    # clear content
    buffer = vim.current.buffer
    vim.command("norm c$")
    del buffer[start:end + 1]

    new_content = template.substitute(config)

    buffer.append(new_content.splitlines(), start)


def mdc_button():
    config = {
        "button_type": "outlined",
        "on_click": None,
        "button_label": None
    }

    row, col = vim.current.window.cursor
    buffer = vim.current.buffer

    new_content = template.substitute(config)
    buffer.append(new_content.splitlines(), row + 1)
