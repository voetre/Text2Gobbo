$SourceText = Get-Content ".\input.txt"
$TextBreakDown = $SourceText.Split(" ")

$SoundArray = New-Object System.Collections.ArrayList

function Gobbonator($Word) {
    switch -Regex ($Word) {
        '^(\b[A-B]\w*\s*)+$' {$SoundArray.Add("file './mp3/1.mp3'")}
        '^(\b[C-D]\w*\s*)+$' {$SoundArray.Add("file './mp3/2.mp3'")}
        '^(\b[E-F]\w*\s*)+$' {$SoundArray.Add("file './mp3/3.mp3'")}
        '^(\b[G-H]\w*\s*)+$' {$SoundArray.Add("file './mp3/4.mp3'")}
        '^(\b[I-J]\w*\s*)+$' {$SoundArray.Add("file './mp3/5.mp3'")}
        '^(\b[K-L]\w*\s*)+$' {$SoundArray.Add("file './mp3/6.mp3'")}
        '^(\b[M-N]\w*\s*)+$' {$SoundArray.Add("file './mp3/7.mp3'")}
        '^(\b[O-P]\w*\s*)+$' {$SoundArray.Add("file './mp3/8.mp3'")}
        '^(\b[Q-R]\w*\s*)+$' {$SoundArray.Add("file './mp3/9.mp3'")}
        '^(\b[S-T]\w*\s*)+$' {$SoundArray.Add("file './mp3/10.mp3'")}
        '^(\b[U-Z]\w*\s*)+$' {$SoundArray.Add("file './mp3/11.mp3'")}
    }
}

for ($Word = 0; $Word -lt ($TextBreakDown.Length); $Word++) {
    Gobbonator($TextBreakDown[$Word].substring(0,1))
}

Write-Host $SoundArray

$SoundArray | Out-File -Append .\TempList.txt -Encoding ASCII

.\ffmpeg.exe -f concat -safe 0 -i ./TempList.txt -c copy output.mp3

Remove-Item .\TempList.txt