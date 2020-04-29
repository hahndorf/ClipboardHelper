Function Set-ClipboardWithoutHistory([string]$Value)
{

    [int]RequestedOperationCopy = 1

    $null = [Windows.ApplicationModel.DataTransfer.DataPackage,Windows.ApplicationModel.DataTransfer,ContentType=WindowsRuntime]
    $null = [Windows.ApplicationModel.DataTransfer.ClipboardContentOptions,Windows.ApplicationModel.DataTransfer,ContentType=WindowsRuntime]
    $null = [Windows.ApplicationModel.DataTransfer.Clipboard,Windows.ApplicationModel.DataTransfer,ContentType=WindowsRuntime]

    $dataPackage = [Windows.ApplicationModel.DataTransfer.DataPackage]::new()

    $cOptions = [Windows.ApplicationModel.DataTransfer.ClipboardContentOptions]::new()
    $cOptions.IsAllowedInHistory = $false
    $cOptions.IsRoamable = $false

    $dataPackage.RequestedOperation = RequestedOperationCopy
    $dataPackage.SetText($Value)

    [Windows.ApplicationModel.DataTransfer.Clipboard]::SetContentWithOptions($dataPackage, $cOptions) | Out-Null

}