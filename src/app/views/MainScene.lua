
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

function MainScene:onCreate()
    -- add background image
    display.newSprite("MainSceneBg.jpg")
        :move(display.center)
        :addTo(self)

    -- add play button
    local playButton = cc.MenuItemImage:create("PlayButton.png", "PlayButton.png")
        :onClicked(function()
            self:getApp():enterScene("PlayScene")
        end)
    cc.Menu:create(playButton)
        :move(display.cx, display.cy - 200)
        :addTo(self)

    ccs.ArmatureDataManager:getInstance():addArmatureFileInfo("duck/NewAnimation0.png",
        "duck/NewAnimation0.plist",
        "duck/NewAnimation.ExportJson")
    local ani = ccs.Armature:create("NewAnimation"):setPosition(200,200):addTo(self);
    ani:getAnimation():play("Animation1");
    local skin = ccs.Skin:createWithSpriteFrameName("鸭子/2.png")
    local bone = ani:getBone("headBone"):addDisplay(skin,1);
    bone :changeDisplayWithIndex(1, true)
end

local function imageCallback(texture)
    print(texture)
end

return MainScene
