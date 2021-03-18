" completion-nvim
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:vimsyn_embed = 'l'
let g:completion_confirm_key = ''
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_trigger_on_delete = 1
let g:completion_chain_complete_list = [
    \{'complete_items': ['snippet', 'lsp']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" UltiSnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsEditSplit="vertical"

nnoremap <Leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <Leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <Leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <Leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <Leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <Leader>vsh :lua vim.lsp.buf.hover()<CR>
nnoremap <Leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.show_line_diagnostics(); vim.lsp.show_line_diagnostics()<CR>
nnoremap <Leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>vll :lua vim.lsp.diagnostic.set_loclist()<CR>

lua << EOF
    local on_attach = require'completion'.on_attach
    local lsp = require'lspconfig'

    lsp.texlab.setup{ on_attach=on_attach }

    lsp.sourcekit.setup{
        on_attach=on_attach,
        filetypes = { "swift" }
    }
    lsp.tsserver.setup{ on_attach=on_attach }
    lsp.clangd.setup {
        on_attach = on_attach,
        root_dir = function() return vim.loop.cwd() end
    }
    lsp.pyls.setup{ on_attach=on_attach }
    lsp.cssls.setup{ on_attach=on_attach }
    lsp.html.setup{ on_attach=on_attach }
EOF

lua << EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- This will disable virtual text, like doing:
    -- let g:diagnostic_enable_virtual_text = 0
    virtual_text = false,

    -- This is similar to:
    -- let g:diagnostic_show_sign = 1
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    signs = true,

    -- This is similar to:
    -- "let g:diagnostic_insert_delay = 1"
    update_in_insert = false,
    underline = false,
  }
)
EOF

nnoremap <Leader>F :Neoformat<CR>