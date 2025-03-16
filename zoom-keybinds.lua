function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function zoomAdd()
    mp.command("add video-zoom +0.05")
    zoom_level = mp.get_property("video-zoom")
    zoom_level = round(zoom_level, 2)
    mp.osd_message("Zoom: "..zoom_level, 0.5)
end

function zoomSub()
    mp.command("add video-zoom -0.05")
    zoom_level = mp.get_property("video-zoom")
    zoom_level = round(zoom_level, 2)
    mp.osd_message("Zoom: "..zoom_level, 0.5)
end

function zoom219()
    mp.command("set video-zoom 0.35")
    mp.osd_message("Zoom 21:9 (0.35)")
end

function zoomReset()
    mp.command("set video-zoom 0")
    mp.osd_message("Zoom Reset")
end

function getAspect()
    aspect = mp.get_property("video-params/aspect")
    crop_x = mp.get_property("video-params/crop-x")
    crop_y = mp.get_property("video-params/crop-y")
    crop_w = mp.get_property("video-params/crop-w")
    crop_h = mp.get_property("video-params/crop-h")
    mp.osd_message("Aspect: "..aspect)
end

function setAspect()
  mp.set_property_number("video-params/aspect", 2.39)
  mp.osd_message("Set Aspect")
end

mp.add_forced_key_binding("=", "zoomAdd", zoomAdd, {repeatable=true})
mp.add_forced_key_binding("-", "zoomSub", zoomSub, {repeatable=true})
mp.add_forced_key_binding("0", "zoomReset", zoomReset)
mp.add_forced_key_binding(")", "zoomReset-2", zoomReset)
mp.add_forced_key_binding("+", "zoom219", zoom219)
mp.add_forced_key_binding("Backspace", "zoom219-2", zoom219)
mp.add_forced_key_binding("a", "getAspect", getAspect)
mp.add_forced_key_binding("s", "setAspect", setAspect)
