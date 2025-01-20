local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    -- Files
    OilFile  = { fg = c.base.white },
    OilFileHidden  = { fg = c.base.dimmed1 },
    OilHidden  = { fg = c.base.white },

    -- Dirs
    OilDir  = { fg = c.base.blue },
    OilDirHidden  = { fg = c.base.blue },
    OilDirIcon  = { fg = c.base.blue },

    -- Sockets
    OilSocket  = { fg = c.base.magenta },
    OilSocketHidden  = { fg = c.base.magenta },

    -- Links
    --   source
    OilLink  = { fg = c.base.cyan },
    OilLinkHidden  = { fg = c.base.cyan },
    OilOrphanLink = { fg = c.base.cyan },
    OilOrphanLinkHidden = { fg = c.base.cyan },
    --  target
    OilLinkTarget  = { fg = c.base.cyan },
    OilLinkTargetHidden = { fg = c.base.cyan },
    OilOrphanLinkTarget = { fg = c.base.red },
    OilOrphanLinkTargetHidden = { fg = c.base.red },

    -- Actions
    OilCreate = { fg = c.base.green },
    OilDelete = { fg = c.base.red },
    OilMove = { fg = c.base.blue },
    OilCopy = { fg = c.base.cyan },
    OilChange = { fg = c.base.blue },
    OilRestore = { fg = c.base.green },
    OilPurge = { fg = c.base.red },
    OilTrash = { fg = c.base.red },
    OilTrashSourcePath = { fg = c.base.red },
  }
end

return M
