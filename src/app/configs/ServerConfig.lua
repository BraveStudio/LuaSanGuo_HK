local ServerConfig = {}

-- 171.212.112.50:8095
ServerConfig.LocalServer = 
{
  PUBLICE_AND = "http://192.168.0.104:8085/sanguoGM/",
  updateUrl = "http://192.168.0.104:8888/sanguoUpdate/"
--   PUBLICE_AND = "http://121.40.145.163:8085/sanguoGM/",
--   updateUrl = "http://z5.tanyu.mobi/hjby/"
}


ServerConfig.LanServer = 
{
    [1] = {
        PUBLICE_AND = "http://112.124.102.179:8085/sanguoGM/" ,
        updateUrl = "http://112.124.102.179:8100/sanguoGM/luaupdate/"
        },
    [2] = {
        PUBLICE_AND = "http://14.63.168.151:8085/sanguoGM/" ,
        updateUrl = "http://szjp-patch-kr.dstamp.net/test1/"
        },
    [3] = {
        PUBLICE_AND = "http://14.63.163.47:8085/sanguoGM/" ,
        updateUrl = "http://szjp-patch-kr.dstamp.net/test2/"
        },
    [4] = {
        PUBLICE_AND = "http://114.215.211.22:8085/sanguoGM/" ,
        updateUrl = "http://114.215.211.22:8100/sanguoGM/luaupdate/"
    },
    [5] = {
        PUBLICE_AND = "http://14.63.170.172:8085/sanguoGM/" ,--live
        updateUrl = "http://szjp-patch-kr.dstamp.net/live/"
    },
    [6] = {
            PUBLICE_AND = "http://115.29.163.19:8085/sanguoGM/" ,--CBT
            updateUrl = "http://115.29.163.19:8100/sanguoGM/luaupdate/"
    },
    [7] = {
        PUBLICE_AND = "http://hjby.tanyu.mobi:8085/sanguoGM/" ,--中文CBT
        updateUrl = "http://hjby.tanyu.mobi:8100/sanguoGM/luaupdate/"
    },
    [8] = {
        PUBLICE_AND = "http://120.26.109.225:8085/sanguoGM/" ,--中文CBT
        updateUrl = "http://120.26.109.225:8100/sanguoGM/luaupdate/"
    },
    [9] = {
        PUBLICE_AND = "http://120.26.64.51:8085/sanguoGM/" ,--中文运营test
        updateUrl = "http://120.26.64.51:8100/sanguoGM/luaupdate/"
    },
    [10] = {
        PUBLICE_AND = "http://210.242.196.40:8085/sanguoGM/" ,--中文运营test
        updateUrl = "http://210.242.196.40:8100/sanguoGM/luaupdate/"
    },
}

--SDK类型
--1 N-store, 2 T-store, 3 C-store, 4 gplay 5 ios-store
ServerConfig.DownLoadUrls = 
{
    [1] = "http://m.nstore.naver.com/appstore/web/detail.nhn?productNo=2075829"
}

ServerConfig.currentURL = nil

function ServerConfig:init()
    if G_IsLinkLoaclIp then
        ServerConfig.currentURL = ServerConfig.LocalServer.PUBLICE_AND
        UpdateServerURL = ServerConfig.LocalServer.updateUrl
    elseif not G_IsAutoGetUrl then
        ServerConfig.currentURL = ServerConfig.LanServer[G_ServerId].PUBLICE_AND
        UpdateServerURL = ServerConfig.LanServer[G_ServerId].updateUrl
        GameState.storeAttr.CurGameDownLoadUrl_s = ServerConfig.DownLoadUrls[G_SDKType]
    elseif G_IsAutoGetUrl then
        if GameState then
            ServerConfig.currentURL = GameState.storeAttr.CurGameLoginUrl_s
            UpdateServerURL = GameState.storeAttr.CurGameUpdateUrl_s
        end
    end
end

function ServerConfig:setURL(loginUrl, updateUrl)
    ServerConfig.currentURL = loginUrl
    UpdateServerURL = updateUrl
end

return ServerConfig