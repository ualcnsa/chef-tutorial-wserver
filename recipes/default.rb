#
# Cookbook:: webserver
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
powershell_script 'Install IIS' do
    action :run
    code 'add-windowsfeature Web-Server'
end

service 'w3svc' do
    action [ :enable, :start ]
end

template 'c:\inetpub\wwwroot\Default.htm' do
    source 'Default.htm.erb'
    rights :read, 'Everyone'
end

windows_package '7zip' do
  source 'http://www.7-zip.org/a/7z1700-x64.msi'
end

windows_package 'Google Chrome' do
  source 'https://dl-ssl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B806F36C0-CB54-4A84-A3F3-0CF8A86575E0%7D%26lang%3Den%26browser%3D3%26usagestats%3D0%26appname%3DGoogle%2520Chrome%26needsadmin%3Dfalse/edgedl/chrome/install/GoogleChromeStandaloneEnterprise.msi'
  action :install
end

windows_package 'Git for windows 2.13.0 (64 bits)' do
    source 'https://github.com/git-for-windows/git/releases/download/v2.13.0.windows.1/Git-2.13.0-64-bit.exe'
    action :install
end
    


