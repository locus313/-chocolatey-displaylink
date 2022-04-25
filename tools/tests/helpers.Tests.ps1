$scriptPath = Join-Path -Path $PSScriptRoot -ChildPath  "..\helpers.ps1" -Resolve
. $scriptPath

$ID = "1045"
Describe "Return web address" {
    Context "Return a non null value" {
        It "should return a non null" {
            {
                Get-WebLocation -URL "https://www.synaptics.com/node/$ID?filetype=exe" -FormData "fileId=$ID&accept_submit=Accept"} | should not benullorempty
        }
    }
    Context "Return No form data submitted" {
        Mock Get-WebLocation {
             throw "No form data submitted"
        }

        It "should return No form data submitted" {
            {
                Get-WebLocation -URL "https://www.synaptics.com/node/$ID?filetype=exe"} | should throw "No form data submitted"
        }
    }
    Context "Return No form data submitted" {
        Mock Get-WebLocation {
            throw "No URL submitted"
        }

        It "should return No URL submitted" {
            {
                Get-WebLocation -FormData "fileId=$ID&accept_submit=Accept"} | should throw "No URL submitted"
        }
    }
}
