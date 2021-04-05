import vim
import re
from string import Template
import parser

template = Template("""
TextField.outlined
    (TextField.config
        |> TextField.setLabel (Just "$label")
        |> TextField.setValue (Just $value)
        |> TextField.setOnInput $on_input
    )
""")



def parse_content(content):
    config = {
        "label": "",
        "value": None,
        "on_input": None
    }

    match = re.search('label "([\w\s]+)"', content)
    if match:
        config["label"] = match.groups()[0]

    match = re.search('value ([\w.]+)', content)
    if match:
        config["value"] = match.groups()[0]

    match = re.search('onInput ([\w\s().]+)', content)
    if match:
        config["on_input"] = match.groups()[0]

    return config

def to_mdc_textfield():

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


