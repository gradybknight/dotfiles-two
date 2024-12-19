return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "                         .,,cc,,,.                                 ",
      "                    ,c$$$$$$$$$$$$cc,                              ",
      "                 ,c$$$$$$$$$$??||??$?? ..                          ",
      "              ,z$$$$$$$$$$$P xdMMbx  nMMMMMb                       ",
      "             r')$$$$??$$$$' dMMMMMMb 'MMMMMMb                      ",
      "           r',d$$$$$>;$$$$ dMMMMMMMMb MMMMMMM.                     ",
      "          d'z$$$$$$$>''''' 4MMMMMMMMM MMMMMMM>                     ",
      "         d'z$$$$$$$$h $$$$r`MMMMMMMMM 'MMMMMM                      ",
      "         P $$$$$$$$$$.`$$$$.''MMMMMP',c,''''..                     ",
      "        d',$$$$$$$$$$$.`$$$$$c,`''_,c$$$$$$$$h                     ",
      "        $ $$$$$$$$$$$$$.`$$$$$$$$$$$'     '$$$h                    ",
      "       ,$ $$$$$$$$$$$$$$ $$$$$$$$$$%       `$$$L                   ",
      "       d$c`?$$$$$$$$$$P'z$$$$$$$$$$c       ,$$$$.                  ",
      "       $$$cc,''''''''.zd$$$$$$$$$$$$c,  .,c$$$$$F                  ",
      "      ,$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$                  ",
      "      d$$$$$$$$$$$$$$$$c`?$$$$$$$$$$$$$$$$$$$$$$$                  ",
      "      ?$$$$$$$$$.'$$$$$$c,`..`?$$$$$$$$$$$$$$$$$$.                 ",
      "      <$$$$$$$$$$. ?$$$$$$$$$h $$$$$$$$$$$$$$$$$$>                 ",
      "       $$$$$$$$$$$h.'$$$$$$$$P $$$$$$$$$$$$$$$$$$>                 ",
      "       `$$$$$$$$$$$$ $$$$$$$',d$$$$$$$$$$$$$$$$$$>                 ",
      "        $$$$$$$$$$$$c`''''',c$$$$$$$$$$$$$$$$$$$$'                 ",
      "        '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$F                  ",
      "         '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'                   ",
      "         .'?$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$P'                    ",
      "      ,c$$c,`?$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'                      ",
      "    z$$$$$P'   ''??$$$$$$$$$$$$$$$$$$$$$$$'                        ",
      " ,c$$$$$P'          .`''????????$$$$$$$$$$c                        ",
      " `'''              ,$$$L.        '?$$$$$$$$$.                      ",
      "                ,cd$$$$$$$$$hc,    ?$$$$$$$$$c                     ",
      "               `$$$$$$$$$$$$$$$.    ?$$$$$$$$$h                    ",
      "                `?$$$$$$$$$$$$P      ?$$$$$$$$$                    ",
      "                  `?$$$$$$$$$P        ?$$$$$$$$$$$$hc              ",
      "                    '?$$$$$$'         <$$$$$$$$$$$$$$r             ",
      "                      `''''           <$$$$$$$$$$$$$$F             ",
      "                                       $$$$$$$$$$$$$F              ",
      "                                       `?$$$$$$$$P'                ",
      "                                         '????''                  ",
      -- "                                                     ",
      -- "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      -- "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      -- "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      -- "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      -- "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      -- "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      -- "                                                     ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
