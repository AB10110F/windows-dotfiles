if vim.g.vscode then
    -- VSCode extension
    require ("vscodeMaps")
else
    -- Neovim
    require ("settings")
    require ("plugins")
    require ("maps")
    require ("plugins-config")
    require ("autocommands")
end
