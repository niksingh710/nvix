{
  inputs,
  pkgs,
  config,
  ...
}:
let
  inherit (config.nvix) icons;
in
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "oil-vcs-status";
      src = inputs.oil-vcs-status;
      dependencies = [ config.plugins.oil.package ];
    })
  ];
  extraConfigLua =
    with icons;
    # lua
    ''
       local status_const = require "oil-vcs-status.constant.status"
       local StatusType = status_const.StatusType
       require "oil-vcs-status".setup {
         status_symbol = {
           [StatusType.Added]                = "${git.LineAdded}",
           [StatusType.Copied]               = "${git.Copied}",
           [StatusType.Deleted]              = "${git.FileDeleted}",
           [StatusType.Ignored]              = "${git.Ignored}",
           [StatusType.Modified]             = "${git.LineModified}",
           [StatusType.Renamed]              = "${git.FileRenamed}",
           [StatusType.TypeChanged]          = "${git.FileChanged}",
           [StatusType.Unmodified]           = " ",
           [StatusType.Unmerged]             = "${git.FileUnmerged}",
           [StatusType.Untracked]            = "${git.FileUntracked}",
           [StatusType.External]             = "",

           [StatusType.UpstreamAdded]       = "${ui.FindFile}",
           [StatusType.UpstreamCopied]      = "󰈢",
           [StatusType.UpstreamDeleted]     = "${ui.BoldClose}",
           [StatusType.UpstreamIgnored]     = " ",
           [StatusType.UpstreamModified]    = "${ui.Pencil}",
           [StatusType.UpstreamRenamed]     = "${ui.FileRename}",
           [StatusType.UpstreamTypeChanged] = "󱧶",
           [StatusType.UpstreamUnmodified]  = " ",
           [StatusType.UpstreamUnmerged]    = "",
           [StatusType.UpstreamUntracked]   = " ",
           [StatusType.UpstreamExternal]    = "",
         }
      }
    '';
  plugins.oil.settings.win_options.signcolumn = "yes:2";
}
