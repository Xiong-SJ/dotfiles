return {
  {
    "willothy/savior.nvim",
    dependencies = {
      "j-hui/fidget.nvim",  -- 必备依赖，用于通知
    },
    config = function()
      local savior = require("savior")
      savior.setup({
        -- 覆盖 conditions，去掉 has_no_errors
        conditions = {
          savior.conditions.is_file_buf,               -- 必须是文件缓冲区
          savior.conditions.not_of_filetype({          -- 排除特定文件类型
            "gitcommit", "gitrebase",
          }),
          savior.conditions.is_named,                  -- 必须有文件名
          savior.conditions.file_exists,               -- 磁盘上文件必须存在
          -- 下面的 has_no_errors 已被移除，因此不再检查 LSP 错误
        },
        -- 其他配置项（可选）保留默认值即可
        -- events = { ... },
        -- throttle_ms = 3000,
        -- defer_ms = 1000,
        -- interval_ms = 30000,
        -- notify = true,
      })
    end,
  },
}
