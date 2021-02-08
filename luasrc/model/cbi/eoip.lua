-- Licensed to the public under the Apache License 2.0.

local uci = luci.model.uci.cursor_state()
local net = require "luci.model.network"
local m, s, n, d, b

m = Map("eoip", translate("EoIP - Tunneling"),
        translatef("Create L2 tunnels compatible with Mikrotik EoIP "))

net = net.init(m.uci)

s = m:section(TypedSection, "eoip", translate("Settings"))
s.addremove = true
s.anonymous = true
s:option(Flag, "enabled", translate("Enable tunnel"))


n = s:option(Value, "name", translate("Interface name "), translate("0 -> zeoip0, 1 -> zeoip1, etc"))
n.nocreate = true
n.datatype = "min(0), integer"
n.default = 0

n = s:option(Value, "idtun", translate("Tunnel ID"), translate("Tunnel ID"))
n.nocreate = true
n.datatype = "min(0), integer"
n.default = 0

d = s:option(Value, "dst", translate("Peer"), translate("Peer IP address for EoIP tunnel"))
d.nocreate = true
d.datatype = "ipaddr"
d.placeholder = "0.0.0.0"

s:option(Flag, "dynamic", translate("Dynamic"))

b = s:option(Value, "bind", translate("Bind address"), translate("Optional bind address"))
b.nocreate = true
b.datatype = "ipaddr"
b.placeholder = ""

return m
