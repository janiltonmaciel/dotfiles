function reload-vpn
	launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*
	launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*
end
