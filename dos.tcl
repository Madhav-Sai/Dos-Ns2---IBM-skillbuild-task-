# Step 1: Create a simulator
set ns [new Simulator]

# Step 2: Create a trace file
set tracefile [open dos.tr w]
$ns trace-all $tracefile

# Step 3: Create a nam file
set namfile [open dos.nam w]
$ns namtrace-all $namfile

# Step 4: Create nodes
set server1 [$ns node]
set server2 [$ns node]
set client1 [$ns node]
set client2 [$ns node]
set attacker [$ns node]

# Step 5: Configure connections and links
$ns duplex-link $client1 $server1 12Mb 10ms DropTail
$ns duplex-link $client2 $server1 12Mb 100ms DropTail
$ns duplex-link $attacker $server1 12Mb 100ms DropTail
$ns duplex-link $server1 $server2 6Mb 200ms DropTail

# Step 6: Configure the queue
$ns queue-limit $server1 $server2 20

# Step 7: Create agents
set udp1 [new Agent/UDP]
$ns attach-agent $client1 $udp1

set udp2 [new Agent/UDP]
$ns attach-agent $client2 $udp2

set udp3 [new Agent/UDP]
$ns attach-agent $attacker $udp3

# Step 8: Create Null agent and attach it to server2
set nullAgent [new Agent/Null]
$ns attach-agent $server2 $nullAgent

# Step 9: Connect agents
$ns connect $udp1 $nullAgent
$ns connect $udp2 $nullAgent
$ns connect $udp3 $nullAgent

# Step 10: Configure CBR traffic 1
set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp1
$cbr1 set packet_size_ 7000
$cbr1 set rate_ 0.4Mb
$cbr1 set random_ false
$cbr1 set interval_ 0.08

# Step 11: Configure CBR traffic 2
set cbr2 [new Application/Traffic/CBR]
$cbr2 attach-agent $udp2
$cbr2 set packet_size_ 4000
$cbr2 set rate_ 0.6Mb
$cbr2 set random_ false
$cbr2 set interval_ 0.05

# Step 12: Configure CBR traffic 3
set cbr3 [new Application/Traffic/CBR]
$cbr3 attach-agent $udp3
$cbr3 set packet_size_ 24000
$cbr3 set rate_ 0.3Mb
$cbr3 set random_ false
$cbr3 set interval_ 0.02

# Step 13: Start and stop traffic
$ns at 0.1 "$cbr1 start"
$ns at 1.0 "$cbr2 start"
$ns at 2.0 "$cbr3 start"
$ns at 2.1 "$cbr1 stop"
$ns at 2.2 "$cbr2 stop"
$ns at 2.3 "$cbr3 stop"

# Step 14: Run simulation
$ns run
