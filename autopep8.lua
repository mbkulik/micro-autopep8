VERSION = "0.0.1"

if GetOption("autopep8") == nil then
	AddOption("autopep8", false)
end

function onSave(view)
	if view.Buf:FileType() == "python" and GetOption("autopep8") then
		autoformat()
	end
end

function autoformat()
	CurView():Save(false)
	local handle = io.popen("autopep8 --inplace -a " .. CurView().Buf.Path)
	local result = handle:read("*a")
	handle:close()

	CurView():ReOpen()
end
	