# WinBatches
Windows batch files. Run this files with administrative privileges.

**SetupWorkingTable.bat** - script to tracking user working days via windows user logon and logoff in group policy. So after running this script creating logon.bat in the "GroupPolicy\User\Scripts\Logon" folder and logoff.bat in the "GroupPolicy\User\Scripts\Logoff". To run this files on user logon and logoff press WIN + R and type gpedit.msc. Then go to path "User Configuration\Windows Settings\Scripts (Logon/Logoff)" and add files in logon/logoff properties. Result table created with this files located in user documents folder.

**VirtualWiFi** - script for creating virtual wifi access point. For changing name and password of the wifi access point see inside the file.
