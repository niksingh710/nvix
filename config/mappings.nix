{ mkKey, ... }:
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
    (mkKeymap "n" "<leader>c" "<esc>:bp | bd #<cr>" "Buffer Close")
    (mkKeymap "n" "<leader>C" "<esc>:q<cr>" "Window Close")

    (mkKeymap "n" "<leader>q" "<cmd>quitall!<cr>" "Quit!")

    (mkKeymap "n" "<leader><cr>"
      {
        __raw = ''
          function()
            local curdir = vim.fn.expand("%:p:h")
            vim.api.nvim_set_current_dir(curdir)
          end
        '';
      } "Change dir")

    (mkKeymapWithOpts "n" "j" ''v:count || mode(1)[0:1] == "no" ? "j" : "gj"'' "Move down" {
      expr = true;
    })
    (mkKeymapWithOpts "n" "k" ''v:count || mode(1)[0:1] == "no" ? "k" : "gk"'' "Move up" {
      expr = true;
    })

    (mkKeymap "n" "<leader>h" "<cmd>nohl<cr>" "No Highlight!")
    (mkKeymap "n" "<leader>a" "gg0vG$" "Select All")

    (mkKeymap "n" "<leader>vv" "<cmd>vsplit<cr>" "vertical split")
    (mkKeymap "n" "<leader>vs" "<cmd>split<cr>" "horizontal split")

    (mkKeymap "n" "<leader>tj" "<cmd>tabn<cr>" "Next Tab")
    (mkKeymap "n" "<leader>tk" "<cmd>tabp<cr>" "Previous Tab")
    (mkKeymap "n" "<leader>tl" "<cmd>tabn<cr>" "Next Tab")
    (mkKeymap "n" "<leader>th" "<cmd>tabp<cr>" "Previous Tab")

    (mkKeymap "n" "<leader>tq" "<cmd>tabclose<cr>" "Close Tab")
    (mkKeymap "n" "<leader>tn" "<cmd>tabnew<cr>" "New Tab")

    (mkKeymap "n" "<leader>ft"
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
      } "Set Filetype")

    (mkKeymap "n" "n" "nzzzv" "Move to center")
    (mkKeymap "n" "N" "Nzzzv" "Moving to center")
    (mkKeymap "n" "x" ''"_x'' "Register x")
  ];
  v = [

    (mkKeymap "v" "<c-s>" "<esc>:w<cr>" "Saving File")
    (mkKeymap "v" "<c-c>" "<esc>" "Escape")

    (mkKeymap "v" "<a-j>" ":m '>+1<cr>gv-gv" "Move Selected Line Down")
    (mkKeymap "v" "<a-k>" ":m '<lt>-2<CR>gv-gv" "Move Selected Line Up")

    (mkKeymap "v" "<" "<gv" "Indent out")
    (mkKeymap "v" ">" ">gv" "Indent in")

    (mkKeymap "v" "<space>" "<Nop>" "Mapped to Nothing")

    (mkKeymap "v" "x" ''"_x'' "Registers x")
    (mkKeymap "v" "P" ''"_dP'' "Register P")

    (mkKeymap "v" "<leader>y" ''"+y'' "Register Y")
    (mkKeymap "v" "<leader>d" ''"+d'' "Register d")
    (mkKeymap "v" "<leader>Y" ''gg"+yG'' "Register Y")
    (mkKeymap "v" "<leader>D" ''gg"+dG'' "Register D")
    (mkKeymap "v" "<leader>x" ''"+x'' "Register x")
    (mkKeymap "v" "<leader>X" ''"+'' "Register X")

  ];
  xv = [
    (mkKeymapWithOpts "x" "j" ''v:count || mode(1)[0:1] == "no" ? "j" : "gj"'' "Move down" {
      expr = true;
    })
    (mkKeymapWithOpts "x" "k" ''v:count || mode(1)[0:1] == "no" ? "k" : "gk"'' "Move up" {
      expr = true;
    })
    (mkKeymap "x" "p" ''p:let @+=@0<CR>:let @"=@0<CR>'' "Dont copy replaced text")
  ];
in
{
  keymaps = insert ++ normal ++ v ++ xv;
}
