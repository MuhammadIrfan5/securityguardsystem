<td>
    @if( $leaves==1)
      <span>Leave</span>
    @endif
    @if( $early_checkouts==1)
        <span>, Early Checkouts</span>
    @endif
    @if( $late_arrivals==1)
        <span>, Late Arrivals</span>
    @endif
    @if( $absents==1)
        <span>, Absent</span>
    @endif
</td>
