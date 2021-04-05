import vim

def get_list_end(start):
    buffer = vim.current.buffer
    row_content = buffer[start]
    end = start
    while "]" not in row_content:
        end += 1
        row_content = buffer[end]
    return end

def get_content():
    
    # gather attributes and label
    row, col = vim.current.window.cursor
    buffer = vim.current.buffer
    attr_line_start = row + 4
    attr_line_end = get_list_end(attr_line_start)
    label_start = attr_line_end + 1
    label_end = get_list_end(label_start)

    content = []
    for c_row in range(row, label_end + 1):
        line = buffer[c_row]
        content.append(line.strip())

    return "".join(content), row, label_end
