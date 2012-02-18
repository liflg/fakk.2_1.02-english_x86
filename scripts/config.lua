Setup.Package
{
	vendor = "liflg.org",
    	id = "fakk2",
    	description = "Heavy Metal: FAKK2",
    	version = "1.02-english",
    	splash = "splash.png",
    	superuser = false,
    	write_manifest = true,
    	support_uninstall = true,
    	recommended_destinations =
    	{
        	"/usr/local/games",
		"/opt/",
		MojoSetup.info.homedir,
    	},

    	Setup.Readme
    	{
        	description = "README",
        	source = "README.liflg"
    	},

    	Setup.Media
    	{
        	id = "fakk2-disc",
        	description = "FAKK2 Loki disc",
        	uniquefile = "fakk/pak0.pk3"
    	},

    	Setup.DesktopMenuItem
    	{
        	disabled = false,
        	name = "Heavy Metal: FAKK2", 
        	genericname = "Heavy Metal: FAKK2",
        	tooltip = "play Heavy Metal: FAKK2",
        	builtin_icon = false,
        	icon = "icon.xpm",  
        	commandline = "%0/fakk2.sh",
		category = "Game",
	},

	Setup.Option
	{
		value = true,
		required = true,
		disabled = false,
		bytes = 390000000, 
		description = "Install the game",

		Setup.File
		{
			wildcards = { "README", "fakk*", "libz*" },
			filter = function(dest)
				if dest == "fakk2.sh" then
					return dest, "0755"
				end
				if dest == "TRANS.TBL" then
					return nil
				end
				return dest
			end
		},

		Setup.File
		{
			source = "media://fakk2-disc/",
			wildcards = { "fakk/*.pk3", "fakk/*.cfg", "icon.xpm" }
		},
		
		Setup.File
		{
			source = "media://fakk2-disc/bin/x86/glibc-2.1/",
			wildcards =  "fakk*",
			filter = function(dest)
				if dest == "fakk2" then
					return dest, "0755"
				end 
				return dest
			end
		},
	},
}

-- end of config.lua ...

