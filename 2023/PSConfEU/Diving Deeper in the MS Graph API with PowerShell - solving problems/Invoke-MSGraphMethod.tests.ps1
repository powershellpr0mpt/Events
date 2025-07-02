Context "Test Graph API throttling" {
    BeforeAll {
        Mock Invoke-WebRequest {
            # Use the actual types returned by your function or directly from Invoke-WebRequest.
            if ($PSVersionTable.PSEdition -eq "Desktop") {
                $WR = New-MockObject -Type 'System.Net.HttpWebResponse'
                $Code = [System.Net.HttpStatusCode]::TooManyRequests
                # Use Add-Member because StatusCode is a read-only field on HttpWebResponse
                $WR | Add-Member -MemberType NoteProperty -Name StatusCode -Value $Code -Force
                $Status = [System.Net.WebExceptionStatus]::ProtocolError
                $Ex = [System.Net.WebException]::new("429", $null, $Status, $WR)
            }
            else {
                $Message = [System.Net.Http.HttpResponseMessage]::new()
                $Message.StatusCode = [System.Net.HttpStatusCode]::TooManyRequests
                $Ex = [Microsoft.PowerShell.Commands.HttpResponseException]::new("429", $Message)
            }
            throw $Ex
        } -ParameterFilter {
            $Uri -eq "http://worldclockapi.com/api/json/utc/NEVER" -and
            $Method -eq "Get"
        }

        $GetRestTimeParams = @{
            Uri   = "http://worldclockapi.com/api/json/utc/NEVER"
            Method = "Get"
        }
    }

    It " Get-RestTime should not run successfully" {
        { Get-RestTime @GetRestTimeParams } | Should -Throw
    }

    It " Get-RestTime should throw a 404 error" {
        $ShouldParams = @{
            # Use the actual types returned by your function or directly from Invoke-WebRequest.
            ExceptionType   = [System.Net.WebException]
            ExpectedMessage = "404: NotFound"
        }
        {
            Get-RestTime @GetRestTimeParams
        } | Should -Throw @ShouldParams
    }
}