$Machines = 'Matthew-PC'
$logfile = "C:\Logs\CounterData.log"
$date= Get-Date

foreach ($machine in $Machines) {

    #$RCounters = Get-Counter -ListSet * -ComputerName $machine
    #"There are {0} counters on {1}" -f $RCounters.count, ($machine)

    $pt = (Get-Counter -Counter "\Processor(_Total)\% Processor Time" -SampleInterval 1 -MaxSamples 5).CounterSamples.CookedValue
    $sample =1
    foreach ($p in $pt) {
        "{3} Sample {2}: CPU is at {0}% on {1}" -f [int]$p, $machine, $sample, $date | Out-File -Append $logfile
        $sample++
    }
}