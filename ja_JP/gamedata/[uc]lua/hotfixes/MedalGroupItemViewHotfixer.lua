local MedalGroupItemViewHotfixer = Class("MedalGroupItemViewHotfixer", HotfixBase)

local function Fix_InitIfNot(self)
  self:_InitIfNot(arg)
  local rectTransform = self.gameObject:GetComponent(typeof(CS.UnityEngine.RectTransform))
  if rectTransform ~= nil then
    rectTransform.pivot = CS.UnityEngine.Vector2(0,1)
    rectTransform.anchoredPosition = CS.UnityEngine.Vector2(0,0)
  else
    LogError("[MedalGroupItemViewHotfixer] transform is null")
  end
end

function MedalGroupItemViewHotfixer:OnInit()
  xlua.private_accessible(CS.Torappu.UI.Medal.MedalGroupItemView)
  self:Fix_ex(CS.Torappu.UI.Medal.MedalGroupItemView,"_InitIfNot", function(self)
    local ok, result = xpcall(Fix_InitIfNot, debug.traceback, self)
    if not ok then
      LogError("[MedalGroupItemViewHotfixer] fix" .. result)
    end
  end)
end

function MedalGroupItemViewHotfixer:OnDispose()
end

return MedalGroupItemViewHotfixer