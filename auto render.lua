function show_massage(item)
  reaper.ShowConsoleMsg(tostring(item).."\n")
end

function left_click(hwnd, x, y)
    reaper.JS_WindowMessage_Post(hwnd, "WM_LBUTTONDOWN", 1, 0, x, y)
    reaper.JS_WindowMessage_Post(hwnd, "WM_LBUTTONUP", 0, 0, x, y)
end

reaper.Main_OnCommand(40035, 0)
reaper.Main_OnCommand(40006, 0)

reaper.CSurf_GoStart()

local file_path = 'F:/Lua/1.mid' --change the path of your midi file here

reaper.InsertMedia(file_path,0)

-- local title = reaper.JS_Localize('MIDI File Import', "common")
-- show_massage(title)
-- window = reaper.JS_Window_Find(title, true)
-- show_massage(window)
-- if window ~= nil then
--   show_massage(window)
--   local title1 = "Expand 3 MIDI tracks to new REAPER tracks"
--   local title2 = "OK"
--   local item = reaper.JS_Window_FindChild(window, title2 , true)
--   reaper.JS_WindowMessage_Send(item, "WM_LBUTTONDOWN", 1, 0, 0, 0)
--   reaper.JS_WindowMessage_Send(item, "WM_LBUTTONUP", 0, 0, 0, 0)
-- end

--show_massage(reaper.NamedCommandLookup('_RS5f8c3fd5b85632b625c34f9f0b432ef56d0bfee5'))
reaper.Main_OnCommand(40296, 0) --select all

num = reaper.CountSelectedTracks( 0 )
show_massage(num)

for i = 0,num-1 do
  track = reaper.GetSelectedTrack( 0, i )
  show_massage(track)
  show_massage(reaper.TrackFX_AddByName(track,'fx_chain_1.RfxChain', false, -1)) --change the path of the fx chain, the vst plugin(Kontakt,Serum,Spire...) is needed
  --TrackFX_Insert(track, 'Sylenth1 (LennarDigital)', 1)
end

reaper.Main_OnCommand(42230,0) --render







