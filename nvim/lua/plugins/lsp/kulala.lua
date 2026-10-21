return{
  "mistweaverco/kulala.nvim",
  -- 仅在打开 .http 或 .rest 文件时加载，保证启动速度
  ft = { "http", "rest" },
  -- opts 必须存在，即使为空表
  opts = {
    -- 默认即可，此选项控制是否开启自动补全
    ui = {
      autocomplete = true,
    },
  },
}
