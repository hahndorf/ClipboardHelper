using uwp = Windows.ApplicationModel.DataTransfer;

namespace Hacon.ClipboardHelper
{
    public static class Windows10Clipboard
    {
        public static void Copy(string text,bool enableHistory, bool enableRoaming)
        {
            uwp.DataPackage dataPackage = new uwp.DataPackage { RequestedOperation = uwp.DataPackageOperation.Copy };
            dataPackage.SetText(text);
            uwp.Clipboard.SetContentWithOptions(dataPackage, new uwp.ClipboardContentOptions() { IsAllowedInHistory = enableHistory, IsRoamable = enableRoaming });
            uwp.Clipboard.Flush();
        }

        public static void Copy(string text)
        {
            Copy(text, false, false);
        }
    }
}
