return {
    transparent_mode = true,

    treesitter_list = {
        "asm",
        "c",
        "cmake",
        "cpp",
        "glsl",
        "lua",
        "make",
        "markdown",
        "python",
        "racket",
        "rust",
        "vim",
        "vimdoc"
    },

    lsp_list = {
        {
            name = "clangd",
            args = {
                "--background-index",
                "--clang-tidy",
                "--header-insertion=never"
            }
        },
        {
            name = "pyright"
        },
        {
            name = "rust_analyzer"
        }
    },

    formatter_list = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        python = { "black" },
        rust = { "rustfmt" }
    },

    dashboard_header = {
        "                                                                                     ",
        "                                                                                     ",
        "                                                                                     ",
        "     ...     ...                               _            .                        ",
        "  .=*8888n..\"%888:                            u            @88>                      ",
        " X    ?8888f '8888                     u.    88Nu.   u.    %8P      ..    .     :    ",
        " 88x. '8888X  8888>       .u     ...ue888b  '88888.o888c    .     .888: x888  x888.  ",
        "'8888k 8888X  '\"*8h.   ud8888.   888R Y888r  ^8888  8888  .@88u  ~`8888~'888X`?888f` ",
        " \"8888 X888X .xH8    :888'8888.  888R I888>   8888  8888 ''888E`   X888  888X '888>  ",
        "   `8\" X888!:888X    d888 '88%\"  888R I888>   8888  8888   888E    X888  888X '888>  ",
        "  =~`  X888 X888X    8888.+\"     888R I888>   8888  8888   888E    X888  888X '888>  ",
        "   :h. X8*` !888X    8888L      u8888cJ888   .8888b.888P   888E    X888  888X '888>  ",
        "  X888xX\"   '8888..: '8888c. .+  \"*888*P\"     ^Y8888*\"\"    888&   \"*88%\"\"*88\" '888!` ",
        ":~`888f     '*888*\"   \"88888%      'Y\"          `Y\"        R888\"    `~    \"    `\"`   ",
        "    \"\"        `\"`       \"YP'                                \"\"                       ",
        "                                                                                     ",
        "                                                                                     ",
        "                                                                                     "
    }
}
