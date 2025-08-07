local luaUtils = CS.Torappu.Lua.Util;
local MedalGroupItemViewHotfixer = Class("MedalGroupItemViewHotfixer", HotfixBase)

local function Fix_InitIfNot(self)
  self:_InitIfNot();
  
  if self._groupImage ~= nil then
    local rectTransform = self._groupImage.rectTransform;
    if rectTransform ~= nil then
      
      rectTransform.anchorMax = CS.UnityEngine.Vector2(1, 0);
      
      rectTransform.sizeDelta = CS.UnityEngine.Vector2(0, 82);
      
      rectTransform.pivot = CS.UnityEngine.Vector2(0, 0);
    end
  end
end

function MedalGroupItemViewHotfixer:OnInit()
  xlua.private_accessible(CS.Torappu.UI.Medal.MedalGroupItemView)
  self:Fix_ex(CS.Torappu.UI.Medal.MedalGroupItemView, "_InitIfNot", function(self)
    local ok, errorInfo = xpcall(Fix_InitIfNot, debug.traceback, self)
      if not ok then
        LogError("fix MedalGroupItemView _InitIfNot error" .. errorInfo)
      end
    end)

end

return MedalGroupItemViewHotfixer