-- Licensed to the public under the Apache License 2.0.

module("luci.controller.eoip", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/eoip") then
		return
	end

	entry({"admin", "network", "eoip"},alias("admin", "network", "eoip", "eoip"),_("EoIP-Tunnel"), 601)
	entry({"admin", "network", "eoip", "eoip"}, cbi("eoip"), _("General"), 5).leaf = true
	
end
