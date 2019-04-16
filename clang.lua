-- scaffold geniefile for clang

clang_script = path.getabsolute(path.getdirectory(_SCRIPT))
clang_root = path.join(clang_script, "clang")

clang_includedirs = {
	path.join(clang_script, "config"),
	clang_root,
}

clang_libdirs = {}
clang_links = {}
clang_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { clang_includedirs }
	end,

	_add_defines = function()
		defines { clang_defines }
	end,

	_add_libdirs = function()
		libdirs { clang_libdirs }
	end,

	_add_external_links = function()
		links { clang_links }
	end,

	_add_self_links = function()
		links { "clang" }
	end,

	_create_projects = function()

project "clang"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		clang_includedirs,
	}

	defines {}

	files {
		path.join(clang_script, "config", "**.h"),
		path.join(clang_root, "**.h"),
		path.join(clang_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
