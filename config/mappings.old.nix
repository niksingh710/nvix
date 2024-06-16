# This file is no more in use as efficient fn is written in lib/default.nix
# Stil here for reference
let
  mapper =
    mode: list: with builtins; {
      key = elemAt list 0;
      action = elemAt list 1;
      mode = "${mode}";
      options =
        if length list > 3 then
          (elemAt list 3)
          // {
            silent = true;
            desc = elemAt list 2;
          }
        else
          {
            silent = true;
            desc = elemAt list 2;
          };
    };

  # This will iterate through the list and will map the key to the action
  iter =
    attr:
    with builtins;
    concatLists (attrValues (mapAttrs (name: value: (map (list: mapper name list) value)) attr));
  mappings = {
    i = [
      [
        "jk"
        "<esc>"
        "Normal Mode"
      ]
      [
        "<c-s>"
        "<esc>:w<cr>"
        "Save file"
      ]
      [
        "<a-j>"
        "<esc>:m .+1<cr>==gi"
        "Move Line Down"
      ]
      [
        "<a-k>"
        "<esc>:m .-2<cr>==gi"
        "Move Line Up"
      ]

    ];
    n = [
      [
        "<c-s>"
        "<cmd>w<cr>"
        "Save the file"
      ]

      [
        "<c-h>"
        "<c-w>h"
        "Focus on right split"
      ]
      [
        "<c-j>"
        "<c-w>j"
        "Focus on below split"
      ]
      [
        "<c-k>"
        "<c-w>k"
        "Focus on up split"
      ]
      [
        "<c-l>"
        "<c-w>l"
        "Focus on left split"
      ]

      [
        "<c-a-j>"
        "<cmd>resize -1<cr>"
        "Resize down"
      ]
      [
        "<c-a-k>"
        "<cmd>resize +1<cr>"
        "Resize up"
      ]
      [
        "<c-a-l>"
        "<cmd>vertical resize -1<cr>"
        "Resize right"
      ]
      [
        "<c-a-h>"
        "<cmd>vertical resize +1<cr>"
        "Resize left"
      ]
      [
        "<c-a-=>"
        "<C-a>"
        "Increase Number"
      ]
      [
        "<c-a-->"
        "<C-x>"
        "Decrease Number"
      ]

      [
        "<a-j>"
        "<cmd>m .+1<cr>=="
        "Move line Down"
      ]
      [
        "<a-k>"
        "<cmd>m .-2<cr>=="
        "Move line up"
      ]

      [
        "<s-h>"
        "<esc>:bprev<cr>"
        "Buffer Previous"
      ]
      [
        "<s-l>"
        "<esc>:bnext<cr>"
        "Buffer Next"
      ]
      [
        "<leader>c"
        "<esc>:bp | bd #<cr>"
        "Buffer Close"
      ]
      [
        "<leader>C"
        "<esc>:q<cr>"
        "Window Close"
      ]

      [
        "<leader>q"
        "<cmd>quitall!<cr>"
        "Quit!"
      ]

      [
        "<leader><cr>"
        {
          __raw = ''
            function()
              local curdir = vim.fn.expand("%:p:h")
              vim.api.nvim_set_current_dir(curdir)
            end
          '';
        }
        "Change dir"
      ]

      [
        "j"
        ''v:count || mode(1)[0:1] == "no" ? "j" : "gj"''
        "Move down"
        { expr = true; }
      ]
      [
        "k"
        ''v:count || mode(1)[0:1] == "no" ? "k" : "gk"''
        "Move up"
        { expr = true; }
      ]

      [
        "<leader>h"
        "<cmd>nohl<cr>"
        "No Highlight!"
      ]
      [
        "<leader>a"
        "gg0vG$"
        "Select All"
      ]

      [
        "<leader>vv"
        "<cmd>vsplit<cr>"
        "vertical split"
      ]
      [
        "<leader>vs"
        "<cmd>split<cr>"
        "horizontal split"
      ]

      [
        "<leader>tj"
        "<cmd>tabn<cr>"
        "Next Tab"
      ]
      [
        "<leader>tk"
        "<cmd>tabp<cr>"
        "Previous Tab"
      ]
      [
        "<leader>tl"
        "<cmd>tabn<cr>"
        "Next Tab"
      ]
      [
        "<leader>th"
        "<cmd>tabp<cr>"
        "Previous Tab"
      ]

      [
        "<leader>tq"
        "<cmd>tabclose<cr>"
        "Close Tab"
      ]
      [
        "<leader>tn"
        "<cmd>tabnew<cr>"
        "New Tab"
      ]

      [
        "<leader>ft"
        {
          __raw = ''
            function()
              vim.ui.input({ prompt = "Enter FileType: " }, function(input)
                local ft = input
                if not input or input == "" then
                  ft = vim.bo.filetype
                end
                vim.o.filetype = ft
              end)
            end
          '';
        }
        "Set Filetype"
      ]

      [
        "n"
        "nzzzv"
        "Move to center"
      ]
      [
        "N"
        "Nzzzv"
        "Moving to center"
      ]
      [
        "x"
        ''"_x''
        "Register x"
      ]

      [
        "<leader>lf"
        "vim.lsp.buf.format"
        "Format file"
      ]
      [
        "<leader>lk"
        "<cmd>lua vim.diagnostic.goto_prev()<cr>"
        "Next Diagnostic"
      ]
      [
        "<leader>lj"
        "<cmd>lua vim.diagnostic.goto_next()<cr>"
        "Prev Diagnostic"
      ]
      [
        "K"
        "vim.lsp.buf.hover"
        "Hover Doc"
      ]

    ];
    v = [
      [
        "<c-s>"
        "<esc>:w<cr>"
        "Saving File"
      ]
      [
        "<c-c>"
        "<esc>"
        "Escape"
      ]

      [
        "<a-j>"
        ":m '>+1<cr>gv-gv"
        "Move Selected Line Down"
      ]
      [
        "<a-k>"
        ":m '<lt>-2<CR>gv-gv"
        "Move Selected Line Up"
      ]

      [
        "<"
        "<gv"
        "Indent out"
      ]
      [
        ">"
        ">gv"
        "Indent in"
      ]

      [
        "<space>"
        "<Nop>"
        "Mapped to Nothing"
      ]

      [
        "x"
        ''"_x''
        "Registers x"
      ]
      [
        "P"
        ''"_dP''
        "Register P"
      ]

      [
        "<leader>y"
        ''"+y''
        "Register Y"
      ]
      [
        "<leader>d"
        ''"+d''
        "Register d"
      ]
      [
        "<leader>Y"
        ''gg"+yG''
        "Register Y"
      ]
      [
        "<leader>D"
        ''gg"+dG''
        "Register D"
      ]
      [
        "<leader>x"
        ''"+x''
        "Register x"
      ]
      [
        "<leader>X"
        ''"+''
        "Register X"
      ]

      [
        "<leader>lf"
        "vim.lsp.buf.format"
        "Format file"
      ]
    ];

    x = [
      [
        "j"
        ''v:count || mode(1)[0:1] == "no" ? "j" : "gj"''
        "Move down"
        { expr = true; }
      ]
      [
        "k"
        ''v:count || mode(1)[0:1] == "no" ? "k" : "gk"''
        "Move up"
        { expr = true; }
      ]
      [
        "p"
        ''p:let @+=@0<CR>:let @"=@0<CR>''
        "Dont copy replaced text"
        { silent = true; }
      ]
      [
        "<leader>lf"
        "vim.lsp.buf.format"
        "Format file"
      ]
    ];

  };
in
{
  keymaps = iter mappings;
}
