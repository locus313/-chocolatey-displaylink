Function Get-WebLocation {
    [cmdletbinding()]
    param(
        [string]$URL,
        [string]$Formdata
    )
        $Body = [byte[]][char[]]$Formdata
        if (!($Body)) {
            throw "No form data submitted"
        }
        if (!($URL)) {
            throw "No URL submitted"
        }
        $Request = [System.Net.HttpWebRequest]::Create($URL)
        $Request.Method = 'POST'
        $Stream = $Request.GetRequestStream()
        $Stream.Write($Body, 0, $Body.Length)
        $Request.ContentType = "application/x-www-form-urlencoded"
        $Request.AllowAutoRedirect = $false
        $Response = $Request.GetResponse()
        $Location = $Response.Headers.GetValues('location')
        return $Location
    }
