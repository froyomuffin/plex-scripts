function toggle_subtitles()
  mp.command("cycle sub-visibility")
  visibility = mp.get_property("sub-visibility") == "yes" and "on" or "off"
  mp.osd_message("Subtitles: "..visibility)
end

mp.add_key_binding("c", "toggle_subtitles", toggle_subtitles)
