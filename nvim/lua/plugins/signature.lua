local success, lsp_signature = pcall(require, "lsp_signature")
if not success then
    return
end

local cfg = {
    debug = true,
    log_path = vim.fn.stdpath("cache") .. "lsp_signature.log",  -- log dir when debug is on

    bind = true, -- This is mandatory, otherwise border config won't get registered.

    handler_opts = {
        border = "rounded"   -- double, rounded, single, shadow, none
    },
}

lsp_signature.setup(cfg)

