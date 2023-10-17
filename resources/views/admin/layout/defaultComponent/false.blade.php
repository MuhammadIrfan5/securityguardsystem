<span @if ($boolean == 'active' || $boolean == 1) class="badge bg-success"
      @endif class="badge bg-warning text-dark">
                                    @if ( $boolean == 1) {{ 'True' }} @else {{ 'False' }} @endif
</span>
