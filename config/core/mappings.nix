{ mkKey, specObj, helpers, ... }:
let
  inherit (mkKey) mkKeymap mkKeymap' mkKeymapWithOpts;
  insert = [
    (mkKeymap "i" "jk" "<esc>" "Normal Mode")
    (mkKeymap "i" "<c-s>" "<esc>:w<cr>" "Save file")
    (mkKeymap "i" "<a-j>" "<esc>:m .+1<cr>==gi" "Move Line Down")
    (mkKeymap "i" "<a-k>" "<esc>:m .-2<cr>==gi" "Move Line Up")
  ];
  normal = [

    (mkKeymap "n" "<c-s>" "<cmd>w<cr>" "Save the file")

    (mkKeymap "n" "<c-h>" "<c-w>h" "Focus on right split")
    (mkKeymap "n" "<c-j>" "<c-w>j" "Focus on below split")
    (mkKeymap "n" "<c-k>" "<c-w>k" "Focus on up split")
    (mkKeymap "n" "<c-l>" "<c-w>l" "Focus on left split")

    (mkKeymap "n" "<c-a-j>" "<cmd>resize -1<cr>" "Resize down")
    (mkKeymap "n" "<c-a-k>" "<cmd>resize +1<cr>" "Resize up")
    (mkKeymap "n" "<c-a-l>" "<cmd>vertical resize -1<cr>" "Resize right")
    (mkKeymap "n" "<c-a-h>" "<cmd>vertical resize +1<cr>" "Resize left")
    (mkKeymap "n" "<c-a-=>" "<C-a>" "Increase Number")
    (mkKeymap "n" "<c-a-->" "<C-x>" "Decrease Number")

    (mkKeymap "n" "<a-j>" "<cmd>m .+1<cr>==" "Move line Down")
    (mkKeymap "n" "<a-k>" "<cmd>m .-2<cr>==" "Move line up")

    (mkKeymap "n" "<s-h>" "<esc>:bprev<cr>" "Buffer Previous")
    (mkKeymap "n" "<s-l>" "<esc>:bnext<cr>" "Buffer Next")

    (mkKeymap "n" "<leader>qq" "<cmd>quitall!<cr>" "Quit!")
    (mkKeymap "n" "<leader>qc"
      (helpers.mkRaw # lua 
        ''
          function()
            local wins = vim.api.nvim_tabpage_list_wins(0)
            local non_floating_wins = 0

            -- Count non-floating windows
            for _, win in ipairs(wins) do
              local config = vim.api.nvim_win_get_config(win)
              if not config.relative or config.relative == "" then
                non_floating_wins = non_floating_wins + 1
              end
            end

            -- Close window or buffer based on the number of non-floating windows
            if non_floating_wins > 1 then
              vim.cmd("close")
            elseif #vim.fn.getbufinfo({buflisted = 1}) > 1 then
              vim.cmd('bdelete')  -- Delete the buffer if more than one buffer is open
            else
              vim.cmd('quit')  -- Quit Neovim if it's the last buffer
            end
          end
        '')
      "Buffer Close")

    (mkKeymapWithOpts "n" "j" ''v:count || mode(1)[0:1] == "no" ? "j" : "gj"''
      "Move down"
      { expr = true; })
    (mkKeymapWithOpts "n" "k" ''v:count || mode(1)[0:1] == "no" ? "k" : "gk"''
      "Move up"
      { expr = true; })

    (mkKeymap "n" "<leader><leader>" "<cmd>nohl<cr>" "no highlight!")
    (mkKeymap "n" "<leader>A" "gg0vG$" "select All")

    (mkKeymap "n" "<leader>|" "<cmd>vsplit<cr>" "vertical split")
    (mkKeymap "n" "<leader>-" "<cmd>split<cr>" "horizontal split")

    (mkKeymap "n" "<leader><tab>j" "<cmd>tabn<cr>" "Next Tab")
    (mkKeymap "n" "<leader><tab>k" "<cmd>tabp<cr>" "Previous Tab")
    (mkKeymap "n" "<leader><tab>l" "<cmd>tabn<cr>" "Next Tab")
    (mkKeymap "n" "<leader><tab>h" "<cmd>tabp<cr>" "Previous Tab")

    (mkKeymap "n" "<leader><tab>q" "<cmd>tabclose<cr>" "Close Tab")
    (mkKeymap "n" "<leader><tab>n" "<cmd>tabnew<cr>" "New Tab")

    (mkKeymap "n" "<leader>ft"
      (helpers.mkRaw # lua
        ''
          function()
            vim.ui.input({ prompt = "Enter FileType: " }, function(input)
              local ft = input
              if not input or input == "" then
                ft = vim.bo.filetype
              end
              vim.o.filetype = ft
            end)
          end
        '')
      "Set Filetype")

    (mkKeymap "n" "n" "nzzzv" "Move to center")
    (mkKeymap "n" "N" "Nzzzv" "Moving to center")

  ];
  v = [

    (mkKeymap "v" "<c-s>" "<esc>:w<cr>" "Saving File")
    (mkKeymap "v" "<c-c>" "<esc>" "Escape")

    (mkKeymap "v" "<a-j>" ":m '>+1<cr>gv-gv" "Move Selected Line Down")
    (mkKeymap "v" "<a-k>" ":m '<lt>-2<CR>gv-gv" "Move Selected Line Up")

    (mkKeymap "v" "<" "<gv" "Indent out")
    (mkKeymap "v" ">" ">gv" "Indent in")

    (mkKeymap "v" "<space>" "<Nop>" "Mapped to Nothing")

  ];
  xv = [
    (mkKeymapWithOpts "x" "j" ''v:count || mode(1)[0:1] == "no" ? "j" : "gj"''
      "Move down"
      { expr = true; })
    (mkKeymapWithOpts "x" "k" ''v:count || mode(1)[0:1] == "no" ? "k" : "gk"''
      "Move up"
      { expr = true; })
  ];
in
{
  keymaps = insert ++ normal ++ v ++ xv;
  wKeyList = [
    (specObj [ "<leader>A" "" "" "true" ])
    (specObj [ "<leader><leader>" "" "" "true" ])
    (specObj [ "<leader>q" "" "quit/session" ])
    (specObj [ "<leader><tab>" "" "tabs" ])
    (specObj [ "z" "" "fold" ])
    (specObj [ "g" "" "goto" ])
    (specObj [ "[" "" "next" ])
    (specObj [ "]" "" "prev" ])
    (specObj [ "<leader>u" "󰔎" "ui" ])
    (specObj [ "<leader>|" "" "vsplit" ])
    (specObj [ "<leader>-" "" "split" ])
  ];

  # For some reason `mkKeymap` assingment freezes neovim
  extraConfigLua = # lua
    ''
      -- Use black hole register for 'x', 'X', 'c', 'C'
      vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'X', '"_X', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'c', '"_c', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'C', '"_C', { noremap = true, silent = true })

      -- Visual mode
      vim.api.nvim_set_keymap('v', 'x', '"_d', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('v', 'X', '"_d', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('v', 'c', '"_c', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('v', 'C', '"_c', { noremap = true, silent = true })


      -- In visual mode, paste from the clipboard without overwriting it
      vim.api.nvim_set_keymap("v", "p", '"_dP', { noremap = true, silent = true })

      -- Only this hack works in command mode
      vim.cmd([[
        cnoremap <C-j> <C-n>
        cnoremap <C-k> <C-p>
      ]])

    '';
}
