$WordCount = Get-Content ".\input.txt" | Measure-Object -Word -IgnoreWhiteSpace | Select-Object -ExpandProperty Words
$SoundArray = New-Object System.Collections.ArrayList

for ($Word = $WordCount; $Word--)
{
    ((ForEach-Object{ Get-Random -Minimum 1 -Maximum 11 } | Where-Object{$_ -ne $prev} | ForEach-Object{$prev = $_; $SoundArray.Add("file './mp3/" + "$_" + ".mp3'") }))
    $SoundArray.Add("file './mp3/silence.mp3'")
}

$SoundArray | Out-File -Append .\TempList.txt -Encoding ASCII

#Edit this to just 'ffmpeg -f concat -safe 0 -i ./TempList.txt -c copy output.mp3' if you have ffmpeg in your system path...
.\ffmpeg.exe -f concat -safe 0 -i ./TempList.txt -c copy output.mp3

Remove-Item .\TempList.txt
