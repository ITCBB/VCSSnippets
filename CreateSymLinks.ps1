$versions = @("2015","2017","2019")

$target = (Resolve-Path .\).Path;

foreach ($i in $versions)
{
	$path = "$env:USERPROFILE\Documents\Visual Studio $i\Code Snippets\Visual C#\My Code Snippets\"

	$exists = (Test-Path -Path $path)

	$empty = $true;
	if($exists)
	{
		$directoryInfo = Get-ChildItem $path | Measure-Object
		$empty = $directoryInfo.count -eq 0
	}

	if(!$empty)
	{
		Write-Host "Folder $path not empty";
	}
	else
	{
		if($exists)
		{
			Remove-Item $path
		}

		New-Item -ItemType SymbolicLink -Path "$path" -Value "$target"
	}
}