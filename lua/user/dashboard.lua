local status_ok, db = pcall(require, "dashboard")
if not status_ok then
     return
end

db.setup({
  theme = 'doom',
  config = {
    header = {
    '',
    '',
    '',
    '           ⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷                    ',
    '       ⣿⣿⣿⣿⣿⣿⣿⠿⠛⠋⢉⣉⣉⣉⣉⣉⣉⣉⣉⡉⠛⠛⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿                ',
    '    ⣿⣿⣿⣿⣿⣿⣿⠟⢋⣠⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣌⡙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿            ',
    '  ⣿⣿⣿⣿⣿⣿⣿⠟⣁⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿        ',
    ' ⣿⣿⣿⣿⣿⣿⡿⢃⣼⣿⣿⣿⣿⣿⣿⣿⢯⣿⣿⣿⣿⣿⣿⡟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿  ',
    ' ⣿⣿⣿⣿⣿⡿⠁⣾⣿⣿⣿⣿⣿⣿⣿⡏⡈⣿⣿⡇⢸⣿⣿⡇⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣷⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    ' ⣿⣿⣿⣿⣿⠇⣰⣿⣿⣿⣿⢻⣿⣿⡟⢠⣷⣌⢻⡇⠈⣿⣿⠁⢀⡄⠙⢏⢻⣿⣿⣿⣿⣿⣿⣇⠄⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    ' ⣿⣿⣿⣿⠟⠄⣿⣿⣿⢻⣿⡈⢿⣿⠃⣸⣿⣿⣦⡁⠄⠘⠻⠄⣼⣿⣦⡈⢸⣿⣿⣿⡏⢹⣿⣿⡆⠄⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣭⡉⠛⠛⣿⣿⣿⣿⣿',
    ' ⣿⣿⠿⠋⠄⣼⣿⣿⣿⡀⣻⣧⠄⠁⠄⠛⠛⠿⠿⢿⣿⣦⣄⠸⠟⠛⠛⠛⠂⣿⣿⣿⠄⠸⢿⣿⣿⣦⡀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠘⠛⠋⠁⠄⠄⣿⣿⣿⣿⣿',
    ' ⣯⣁⣀⣀⣀⣀⠄⠄⣀⡀⣿⣿⣧⠄⠄⢀⣀⣀⣠⣾⣿⣿⣿⣷⣦⣄⣀⠄⠄⢹⣿⡇⠄⠄⣀⣀⠄⠈⠉⠄⠄⠙⣻⣿⣿⣿⣿⣿⣿⣿⣄⡀⠄⠄⠄⢀⣾⣿⣿⣿⣿',
    ' ⣿⣿⣿⣿⣿⠿⠄⠚⠋⠁⠘⣿⣿⠄⢰⣄⣀⠄⠉⠉⠉⠉⠉⠉⠁⠄⢀⣀⣀⠘⣿⠇⠄⢀⣉⠙⠃⠄⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⡛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    ' ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠄⠘⠏⠄⣸⣿⣿⡿⠄⠄⠄⠄⠄⠄⠄⠄⢸⣿⣿⡄⠉⠄⠄⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣍⣁⣨⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    ' ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠄⠄⠄⢤⣿⣿⣿⠃⣶⣶⠷⠤⠄⢾⣿⡿⡀⠻⣿⣷⡀⠄⠄⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    '  ⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠄⠄⣸⣿⣿⠇⠄⢀⣉⠄⠄⠄⡀⢁⠄⠄⠄⢻⣿⣷⡄⠄⢸⣿⣿⣿⣿⣿⣿⡏⡟⢘⢿⡟⡏⢿⣿⣟⡛⣿⣿⣿⣿⣿⣛⡙⣛⣿⣿⣿',
    '  ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠄⢠⣿⣿⡟⠄⠄⣿⣿⠏⠄⠄⠘⢿⡿⠄⠄⠄⢻⣿⣿⣄⢈⣿⣿⣿⣿⣿⣿⡇⡰⢸⢸⠇⡆⣆⢻⣿⡇⣿⣍⣤⡌⣿⣉⡁⢉⣿⣿⣿',
    '   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣿⣿⠟⠄⠄⠄⠄⠂⠄⠄⠄⠄⠄⠄⠂⠄⠄⠄⠘⢿⣿⣾⣿⣿⣿⣿⣿⣿⡇⣇⠸⣸⢰⢰⡿⢸⡿⢡⣿⣿⣿⠇⣿⢣⣤⣸⣿⣿⣿',
    '   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⣰⣿⣿⡷⢀⣴⣾⣿⣿⣷⣦⡀⢠⣾⣿⣿⣄⠄⠙⢿⣿⣿⣿⣿⣿⣿⣿⣥⣿⣿⣤⣎⣴⣿⣧⣤⣽⣿⣤⣾⣿⣎⣉⣹⣿⣿ ',
    '   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠄⠚⠿⣿⣿⠇⣾⣿⣿⣿⣿⣿⣿⣷⢸⣿⡿⠿⠛⠁⠄⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿       ',
    '  ⣿⣿⣿⣿⣿⣿⣿⠟⠉⠄⠄⠄⠄⠄⠄⠄⠉⠉⠉⢉⣉⠉⠉⠉⠈⠄⠄⠄⠄⠄⠄⠄⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿          ',
    ' ⣿⣿⣿⣿⣿⣿⡿⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣤⣿⣿⣤⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿              ',
    '  ⣿⣿⣿⣿⣿⣿⣇⣀⡀⠄⠄⠄⠄⠄⣀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣷⣄⣀⠄⠄⠄⠄⠄⠄⠄⠄⣼⣿⣿⣿⣿⣿⣿⣿                 ',
    '    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣶⣾⣿⣿⣿⣿⣿                     ',
    '',
    '',
    '',
    }, --your header
    center = {
          {
            --[[ icon = '  ', ]]
            desc = 'File Browser                                                          ',
            action = "Telescope find_files previewer=false layout_config={prompt_position='top'} disable_devicons=true"
          },
          {
            --[[ icon = '  ', ]]
            desc = 'New File',
            action = 'new'
          },
          {
            --[[ icon = '  ', ]]
            desc = 'Recently Opened Files',
            action = "Telescope oldfiles previewer=false layout_config={prompt_position='top'} disable_devicons=true"
          },
          {
            --[[ icon = '  ', ]]
            desc = 'Find Word',
            action = "Telescope live_grep layout_config={prompt_position='top'} disable_devicons=true"
          },
          {
            --[[ icon = '  ', ]]
            desc = 'Open Config',
            action = "cd ~/.config/nvim/ | e ~/.config/nvim/init.lua"
          },
          {
            --[[ icon = '  ', ]]
            desc = 'Exit Neovim',
            action = "qa!"
          },

        },
    footer = {"Dying is the easy part","Ur not smart looooooooooool"}  --your footer
  }
})













--images
--db.preview_command = 'ueberzug'
--db.custom_header = {
--  "                ░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░                ",
--  "            ░░▒▓█▓▒▒▒▒▒▒▓▓██▓▓▓▒▒▒▒▓▓▒░              ",
--  "          ░▒▓█▓▒▒▓█▓▓▓▓░░░▒███████▓▓▒▒█▓▒            ",
--  "        ░▓██▓▒▒█████████▒░░░█████████▓▒▒██▓          ",
--  "      ░▓███▓▒████████████░░░▒██████████▓░▓██▓        ",
--  "     ▒████▒▓█████████████▓░░░▓███████████░▓███▒      ",
--  "    ▒████▓▒███████████████░░░░████████████░████▒     ",
--  "   ▒█████░███████████████▓░░░░▒███████████▒▒████▒    ",
--  "  ░█████▓▒███████████████▒▓▓░░░▒██████████▓░█████░   ",
--  " ░██████▓▒██████████████▒▓███░░░▓██████████░██████░  ",
--  " ░██████▓░█████████████░▓████▓░░░▓████████▓░██████░  ",
--  " ▒███████░▓███████████░▓██████▒░░░████████▒▓██████▒  ",
--  " ▒███████▒▒█████████▓░▒████████░░░░██████▓▒███████▓  ",
--  " ▒███████▒▒▒███████▓░▒██████████░░░░████▓░████████▒  ",
--  " ░███████▓░▒▓█████▓░░███████████▓░░░░██▒░█████████░  ",
--  " ░▓██████▓▒░░▒▒▓█▓░░█████████████▒░░▒▒░▒▓█████████░  ",
--  "  ░███████▒▒░░░░░▒▓███████████████▒░░░▒▒█████████░   ",
--  "  ░▒██████▒▒░░░▒▒▒▒▒▒▒▒▒▓█▓▓▓▓▓▓▒▒▒░░░▓▒████████▒    ",
--  "   ░▒██████████████████▓░░░░███████████████████▒     ",
--  "     ░████████▓▓▓▓░░░░░░▒░░░░░░░░░░▓▓▓████████░      ",
--  "      ░▒████████▓▓▒░░░░░█▒▓░░░░░░░▒▓▓███████▒        ",
--  "        ░▒█████████▓▒▒░░▓▒▓░░░▒▓██████████▒          ",
--  "           ░▓███████▒▓▒▒░░░░░▒▓████████▓▒            ",
--  "              ░▒▓████▓▓▒▒▓░▓▒▒█████▓▒░               ",
--  "                      ▒▒▒▓▓▓▒▒                       ",
--  "                                                     "
--}

--db.custom_header={
--    '',
--    '    ████▌█████▌█ ████████▐▀██▀    ',
--    '  ▄█████ █████▌ █ ▀██████▌█▄▄▀▄   ',
--    '  ▌███▌█ ▐███▌▌  ▄▄ ▌█▌███▐███ ▀  ',
--    ' ▐ ▐██  ▄▄▐▀█   ▐▄█▀▌█▐███▐█      ',
--    '   ███ ▌▄█▌  ▀  ▀██  ▀██████▌     ',
--    '    ▀█▌▀██▀ ▄         ███▐███     ',
--    '     ██▌             ▐███████▌    ',
--    '     ███     ▀█▀     ▐██▐███▀▌    ',
--    '     ▌█▌█▄         ▄▄████▀ ▀      ',
--    '       █▀██▄▄▄ ▄▄▀▀▒█▀█           ',
--    '',
--    }
db.custom_header = {
    '',
    '           ⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷                    ',
    '       ⣿⣿⣿⣿⣿⣿⣿⠿⠛⠋⢉⣉⣉⣉⣉⣉⣉⣉⣉⡉⠛⠛⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿                ',
    '    ⣿⣿⣿⣿⣿⣿⣿⠟⢋⣠⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣌⡙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿            ',
    '  ⣿⣿⣿⣿⣿⣿⣿⠟⣁⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿        ',
    ' ⣿⣿⣿⣿⣿⣿⡿⢃⣼⣿⣿⣿⣿⣿⣿⣿⢯⣿⣿⣿⣿⣿⣿⡟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿  ',
    ' ⣿⣿⣿⣿⣿⡿⠁⣾⣿⣿⣿⣿⣿⣿⣿⡏⡈⣿⣿⡇⢸⣿⣿⡇⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣷⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    ' ⣿⣿⣿⣿⣿⠇⣰⣿⣿⣿⣿⢻⣿⣿⡟⢠⣷⣌⢻⡇⠈⣿⣿⠁⢀⡄⠙⢏⢻⣿⣿⣿⣿⣿⣿⣇⠄⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    ' ⣿⣿⣿⣿⠟⠄⣿⣿⣿⢻⣿⡈⢿⣿⠃⣸⣿⣿⣦⡁⠄⠘⠻⠄⣼⣿⣦⡈⢸⣿⣿⣿⡏⢹⣿⣿⡆⠄⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣭⡉⠛⠛⣿⣿⣿⣿⣿',
    ' ⣿⣿⠿⠋⠄⣼⣿⣿⣿⡀⣻⣧⠄⠁⠄⠛⠛⠿⠿⢿⣿⣦⣄⠸⠟⠛⠛⠛⠂⣿⣿⣿⠄⠸⢿⣿⣿⣦⡀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠘⠛⠋⠁⠄⠄⣿⣿⣿⣿⣿',
    ' ⣯⣁⣀⣀⣀⣀⠄⠄⣀⡀⣿⣿⣧⠄⠄⢀⣀⣀⣠⣾⣿⣿⣿⣷⣦⣄⣀⠄⠄⢹⣿⡇⠄⠄⣀⣀⠄⠈⠉⠄⠄⠙⣻⣿⣿⣿⣿⣿⣿⣿⣄⡀⠄⠄⠄⢀⣾⣿⣿⣿⣿',
    ' ⣿⣿⣿⣿⣿⠿⠄⠚⠋⠁⠘⣿⣿⠄⢰⣄⣀⠄⠉⠉⠉⠉⠉⠉⠁⠄⢀⣀⣀⠘⣿⠇⠄⢀⣉⠙⠃⠄⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⡛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    ' ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠄⠘⠏⠄⣸⣿⣿⡿⠄⠄⠄⠄⠄⠄⠄⠄⢸⣿⣿⡄⠉⠄⠄⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣍⣁⣨⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    ' ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠄⠄⠄⢤⣿⣿⣿⠃⣶⣶⠷⠤⠄⢾⣿⡿⡀⠻⣿⣷⡀⠄⠄⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    '  ⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠄⠄⣸⣿⣿⠇⠄⢀⣉⠄⠄⠄⡀⢁⠄⠄⠄⢻⣿⣷⡄⠄⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    '  ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠄⢠⣿⣿⡟⠄⠄⣿⣿⠏⠄⠄⠘⢿⡿⠄⠄⠄⢻⣿⣿⣄⢈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    '   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣿⣿⠟⠄⠄⠄⠄⠂⠄⠄⠄⠄⠄⠄⠂⠄⠄⠄⠘⢿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    '   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⣰⣿⣿⡷⢀⣴⣾⣿⣿⣷⣦⡀⢠⣾⣿⣿⣄⠄⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ',
    '   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠄⠚⠿⣿⣿⠇⣾⣿⣿⣿⣿⣿⣿⣷⢸⣿⡿⠿⠛⠁⠄⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿       ',
    '  ⣿⣿⣿⣿⣿⣿⣿⠟⠉⠄⠄⠄⠄⠄⠄⠄⠉⠉⠉⢉⣉⠉⠉⠉⠈⠄⠄⠄⠄⠄⠄⠄⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿          ',
    ' ⣿⣿⣿⣿⣿⣿⡿⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣤⣿⣿⣤⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿              ',
    '  ⣿⣿⣿⣿⣿⣿⣇⣀⡀⠄⠄⠄⠄⠄⣀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣷⣄⣀⠄⠄⠄⠄⠄⠄⠄⠄⣼⣿⣿⣿⣿⣿⣿⣿                 ',
    '    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣶⣾⣿⣿⣿⣿⣿                     ',
    '',
}

---db.custom_header = {
---    '',
---    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⢢⢳⡝⡝⠪⡈⢀⣵⣹⣻⣿⣟⡅⠘⢼⣽⣿⢇⣧⣿⢙⣿⡇⣿⢹⣏⣼⢇⠏⠀⣷⣼⡸⣶⣻⡌⣿⣻⡸⣨⢯⣘⣹⣿⡾⣿⣿⡾⢳⡘⠱',
---    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⡈⠀⡜⠤⠠⠁⠈⠁⣡⡋⣮⡿⡿⢱⡇⠀⢸⣿⣿⢺⣿⡿⣿⣿⢳⣿⣿⢵⡟⣎⡎⡀⣿⣎⡇⣿⣇⣧⢹⣿⣧⢇⣾⣏⡅⢿⣿⣿⣿⣧⣾⡇⣾',
---    '⠀⠀⠀⠀⠀⠀⠀⠀⣀⠁⢄⠡⣌⠈⠘⡤⠹⢺⢲⣹⢿⡇⣾⡆⠀⢸⣿⣿⢸⣿⣿⣿⣿⣸⣷⣟⣿⡙⣾⣉⡇⢸⣿⣷⢹⣿⢾⠸⣿⣿⣸⣻⣿⡿⣾⣿⣾⣿⣿⡋⣇⢡',
---    '⠠⠀⠀⠀⠀⠀⠀⢈⠌⠂⠘⠀⡧⠁⡾⢠⢰⠣⡈⠿⣿⢰⣿⡇⠀⢸⡿⣿⢸⣿⣿⣿⡏⣾⣽⢿⣯⣹⣟⣿⣿⠸⣿⣿⠉⣿⣿⡆⣿⣿⡇⣿⣿⣿⢁⣿⣿⣿⣿⡇⣿⢸',
---    '⠀⠀⠀⠀⠀⠀⠀⡢⠐⠄⠀⠀⠀⠀⠀⠀⠘⠘⠰⣀⡟⢸⣿⡇⡄⢨⡇⣛⢸⣿⣯⢹⡇⡿⣿⣿⡅⣿⣹⣿⣿⠀⣿⣿⠄⢹⡿⡇⣿⡟⣿⣿⣿⣿⣾⣿⣿⣿⣿⡇⣟⢿',
---    '⠀⠀⠀⠀⠀⠀⠀⢜⠀⠀⢐⠀⠀⠀⠀⠀⠀⠀⠈⣿⡇⠿⠿⠇⠇⠐⡅⢯⠸⡝⢻⣿⠻⣿⢳⡏⢸⣏⣿⣿⣿⡆⣿⢹⡇⢸⣷⡇⣿⣇⣿⣿⣿⣿⢽⣿⣿⣿⣿⣗⣯⡎',
---    '⡀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⢂⠀⠀⠀⢠⢀⠀⡇⣅⡀⠀⠀⠀⠸⠂⠐⢘⠫⠸⡿⢸⣿⣹⠇⠿⠣⠿⣿⣿⡇⠿⠸⣿⠀⣿⡕⣿⣏⣿⣿⣿⣿⠸⣿⣿⣿⣿⣗⣗⣿',
---    '⡖⢒⠄⠀⡀⣈⠌⢀⠀⠀⡄⠀⠀⠀⠊⢠⠐⠐⠀⣇⣿⣿⣿⣿⠸⡄⠄⠈⠈⠀⠀⡏⢸⠍⣿⢠⣀⠁⠀⠀⠀⠀⠉⢈⡏⠀⣽⡏⣿⣿⡇⢹⣿⣧⢰⣿⣿⣿⣿⣿⣿⠉',
---    '⢞⡞⠀⠀⢌⠞⠀⠀⠈⢰⠻⠀⠀⣿⣿⣿⣷⠤⠒⠸⠸⠿⢿⣿⣇⢷⠀⠀⠀⠀⠀⠁⢸⠀⡿⢸⡇⣸⣿⣶⣶⣦⠀⠀⡇⠀⠘⠇⢍⣻⡏⣼⢿⠠⠈⣿⢿⣿⢻⠏⠜⢠',
---    '⠂⡠⠄⠰⡘⢀⠀⠀⠀⣸⡄⠀⠀⢿⡿⣿⣯⣰⣶⡆⢀⠀⠄⠈⠻⣪⣧⣀⣡⣀⣀⠀⡈⡁⡇⣿⣷⢸⣿⣿⣿⣿⠀⠀⣼⠇⠀⠃⠘⠜⢠⠯⠃⠂⢘⣿⣻⣿⡌⠀⢰⣼',
---    '⠄⠐⢐⠊⠀⠀⠀⠀⠀⡂⣇⠀⠀⠸⣷⣼⣿⣯⣿⣧⣀⠀⠀⣰⣧⢸⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⠿⠿⠒⠤⣿⣄⣀⠀⢁⡢⠈⡅⠀⠀⣠⡟⣿⡟⣀⠀⠘⠃',
---    '⡐⠀⠊⠀⠀⠀⠀⠀⢀⢹⠈⠀⠀⠀⢻⣿⣿⣿⣿⣾⣯⣽⣏⠉⠉⣜⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢩⣾⠀⠀⠐⠀⢠⡈⢛⡟⠉⣿⣿⣶⡇⠀⢼⠷⣹⢃⡿⣧⠅⠈',
---    '⡾⠘⠀⠀⡀⠀⠀⠀⠨⡈⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠙⠻⢦⣀⣀⣠⣾⣿⣶⡗⣰⣿⣿⣿⠀⠐⡾⢸⠎⣼⣧⡟⢺⠀',
---    '⡄⠈⡁⠀⠄⠀⠀⠀⢆⢦⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣷⣤⣤⣶⣤⣶⣷⣾⣿⢋⣦⣿⣿⣿⠇⢠⠈⠇⡄⢰⢻⠟⢸⢸⠀',
---    '⡗⢼⣷⡄⠀⠐⠀⠠⠣⡖⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⢄⠙⠐⢁⡿⠋⠀⡈⢸⠀',
---    '⣇⠛⣿⣿⡈⡀⠀⢀⠄⠂⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠔⡬⡀⠊⠉⠀⠀⡀⡇⠸⠀',
---    '⣩⡐⣉⢛⣲⡀⣀⠀⢠⡄⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⣨⠂⢀⢱⡁⠠⢠⠁⡅⠂⠠⠀',
---    '⣿⣿⣦⢙⠿⣽⣿⣷⣜⡇⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣾⣝⣻⣛⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⢨⠍⢠⣉⡆⢀⠀⠃⠀⢱⠀⠀⡂',
---    '⣫⣾⣿⡷⢺⣿⣿⣿⣿⡄⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡯⢽⠟⠟⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⣴⡿⠀⣢⢐⠀⡀⠁⠀⠐⠘⡀⠀⠐',
---    '⠙⠋⣩⣔⢸⣿⣿⣿⣿⣇⢰⡄⠀⠀⠀⡙⠿⣿⣦⠀⡂⡂⠙⢿⣿⣦⡈⠙⠟⠛⠛⠀⠀⠸⣾⣿⣿⣿⣿⣿⡿⢟⠩⠀⠀⠀⢀⡾⠏⠁⢘⠔⠫⠀⠀⠀⠀⠀⠂⠁⠀⠀',
---    '⠓⢲⣿⣿⢸⣿⣿⣿⣿⣿⠈⣿⣦⣀⠢⢀⢑⠠⡈⠀⠄⢡⠀⢰⠝⢿⣿⣷⣤⡖⢲⣦⣤⣶⣿⣿⣿⣿⣿⣭⣦⡽⣡⠂⠀⠠⠊⠑⠀⢀⠡⡏⠐⠄⠄⠀⠀⠀⢰⢰⠀⠀',
---    '⠓⢸⣿⣿⣼⣿⣿⣿⣿⣿⣶⣌⠙⠻⠷⠤⠀⠀⠀⠀⡀⢸⠀⢸⣿⡆⣝⢿⣷⣶⡄⣿⣿⣿⡿⣛⣹⣿⣿⣿⣿⡿⠃⠠⣊⠀⠀⠀⠀⢄⢍⠀⠰⢠⠃⠀⢀⡀⢸⢪⡆⢦',
---    '⣦⡚⣿⣿⣧⣿⣿⣿⣿⢿⣿⣿⣿⣷⣶⣶⣿⣷⣦⠀⠀⠘⡇⢸⣸⣗⣿⣶⣮⣭⣥⣩⣍⠲⣿⣿⣿⣿⣿⣿⠟⠁⡠⠔⠐⠀⡀⠀⢬⠏⣰⡆⠸⢸⠀⡀⣼⠃⢸⠑⠁⠺',
---    '',
---    '',
---}
--images
--db.preview_file_path = home .. '/.config/nvim/static/dashboard1.png'
--db.preview_file_height = 10
--db.preview_file_width = 70
--[[ db.custom_center = { ]]
--[[       {icon = '', ]]
--[[       --icon = '  ', ]]
--[[       desc = 'File Browser                                            ', ]]
--[[       action = "Telescope find_files previewer=false layout_config={prompt_position='top'} disable_devicons=true", ]]
--[[       shortcut = '~'}, ]]
--[[       {icon = '', ]]
--[[       --icon = ' ', ]]
--[[       desc = 'New File                                                ', ]]
--[[       shortcut = '~', ]]
--[[       action ='DashboardNewFile'}, ]]
--[[       {icon = '', ]]
--[[       --icon = ' ', ]]
--[[       desc = 'Recently Opened Files                                   ', ]]
--[[       action = "Telescope oldfiles previewer=false layout_config={prompt_position='top'} disable_devicons=true", ]]
--[[       shortcut = '~'}, ]]
--[[       {icon = '', ]]
--[[       --icon = ' ', ]]
--[[       desc = 'Find Word                                               ', ]]
--[[       action = "Telescope live_grep layout_config={prompt_position='top'} disable_devicons=true", ]]
--[[       shortcut = '~'}, ]]
--[[       {icon = '', ]]
--[[       --icon = ' ', ]]
--[[       desc = 'Open Config                                             ', ]]
--[[       action = 'cd ~/.config/nvim/ | e ~/.config/nvim/init.lua', ]]
--[[       shortcut = '~'}, ]]
--[[       {icon = '', ]]
--[[       --icon = ' ', ]]
--[[       desc = 'Exit Neovim                                             ', ]]
--[[       action = 'qa!', ]]
--[[       shortcut = '~'}, ]]
--[[     } ]]
--[[]]
--[[ db.custom_footer = {"dying is the easy part","reminder: ur not smart loooooooooooool", "loooooooooooooooool"} ]]
--[[]]

