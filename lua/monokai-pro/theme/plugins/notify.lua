local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
--- @param hp Helper
M.setup = function(c, config, hp)
  local isBackgroundClear = vim.tbl_contains(config.background_clear, "notify")
  local notify_groups = {
    NotifyERRORBorder = { fg = hp.blend(c.inputValidation.errorBorder, 0.3) },
    NotifyWARNBorder = { fg = hp.blend(c.inputValidation.warningBorder, 0.3) },
    NotifyINFOBorder = { fg = hp.blend(c.inputValidation.infoBorder, 0.3) },
    NotifyDEBUGBorder = { fg = hp.blend(c.base.dimmed2, 0.3) },
    NotifyTRACEBorder = { fg = hp.blend(c.base.magenta, 0.3) },
    NotifyERRORIcon = { fg = c.inputValidation.errorForeground },
    NotifyWARNIcon = { fg = c.inputValidation.warningForeground },
    NotifyINFOIcon = { fg = c.inputValidation.infoForeground },
    NotifyDEBUGIcon = { fg = c.base.white },
    NotifyTRACEIcon = { fg = c.base.magenta },
    NotifyERRORTitle = { link = "NotifyERRORIcon" },
    NotifyWARNTitle = { link = "NotifyWARNIcon" },
    NotifyINFOTitle = { link = "NotifyINFOIcon" },
    NotifyDEBUGTitle = { fg = c.base.dimmed2 },
    NotifyTRACETitle = { fg = c.base.magenta },
    NotifyERRORBody = { link = "Normal" },
    NotifyWARNBody = { link = "Normal" },
    NotifyINFOBody = { link = "Normal" },
    NotifyDEBUGBody = { link = "Normal" },
    NotifyTRACEBody = { link = "Normal" },
    NotifyBackground = { link = "Normal" },
  }
  if not isBackgroundClear then
    local BORDER = "Border"
    local ICON = "Icon"
    local TITLE = "Title"
    local BODY = "Body"
    for group, hlValue in pairs(notify_groups) do
      if string.match(group, BORDER) then
        notify_groups[group] = {
          bg = c.notifications.background,
          fg = c.notifications.border,
        }
      end
      if string.match(group, ICON) or string.match(group, TITLE) then
        notify_groups[group] = vim.tbl_deep_extend("force", hlValue or {}, {
          bg = c.notifications.background,
        })
      end
      if string.match(group, BODY) or group == "NotifyBackground" then
        notify_groups[group] = {
          bg = c.notifications.background,
          fg = c.notifications.foreground,
        }
      end
    end
  end
  return notify_groups
end

return M
