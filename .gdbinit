set $nc_hit = 0
define nc
set $total = $arg0
set $i = 0
   while($i<$total)
     set $i = $i + 1
     set $nc_hit = $nc_hit + 1
     print $i
     print $nc_hit
     thread
     bt 3
     continue
   end
end

set $bp_hit = 1

define bt_on_all_bp
set $total = $bpnum
set $i = 1
   while($i<=$total)
     print $i
     commands $i
       echo BP hit:
       print $bp_hit
       bt
       set $bp_hit = $bp_hit + 1
       echo "\n"
       cont
       end
     set $i = $i + 1
   end
end
