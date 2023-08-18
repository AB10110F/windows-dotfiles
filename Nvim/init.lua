if vim.g.vscode then
    -- VSCode extension
    require ("vscodeMaps")
else
    -- ordinary Neovim
    require ("settings")
    require ("plugins")
    require ("maps")
    require ("plugins-config")
end
