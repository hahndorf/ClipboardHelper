# ClipboardHelper
Helper Assembly to copy text to the Windows clipboard without adding it to the history.

## Reasoning

In PowerShell I often copy text into the Windows clipboard. Sometimes the information 
is sensitive and I clear the clipboard straight after use.

With version 1809 of Windows 10, Microsoft introduced two new features to the Windows clipboard.

- Clipboard History - to keep multiple entries of the clipboard content around.
- Cloud Sync - to sync your clipboard content to your Microsoft account, so you can access it from other devices.

Both these new features sound cool, but I certainly don't want to use them with my sensitive data.

PowerShell has the `Set-Clipboard` cmdlet to copy a text to the clipboard,
but if the user has enabled the clipboard history there is no way in your 
PowerShell script to prevent your data ending up in the history.

For this reason I had to keep the clipboard history turned off.

## Solution

The solution I came up with is a small .Net Framework assembly that can access 
new APIs in Windows 10 to copy text to the clipboard without adding it to 
the history.

The Assembly targets .Net Framework Vs.4.8, I guess 4.6 and 4.7 should work as well.

Also you need to have Windows 10 version 1903 or newer.

Just build the project in Visual Studio and copy the resulting DLL to a 
well-known location on your device.

You can also download the DLL using the releases link on Github.

## Usage in PowerShell:

Now to copy text to the clipboard without adding it to the history use:

    [Reflection.Assembly]::LoadFile("C:\stuff\Hacon.ClipboardHelper.dll") | Out-Null
    [Hacon.ClipboardHelper.Windows10Clipboard]::Copy("my sensitive data")

The copy method has an overload which allows you to be more specific:

    [Hacon.ClipboardHelper.Windows10Clipboard]::Copy("my sensitive data",$true,$false)

This allows the history but prevents using the cloud sync.

The basic Copy method has both parameters set to $false.
