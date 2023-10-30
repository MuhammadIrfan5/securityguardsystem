<span @if ($boolean == 'active' || $boolean == 1) class="badge bg-success"
      @endif class="badge bg-warning text-dark">
                                    @if ( $boolean == 1) <i class="bi bi-check-circle me-1"></i>{{ 'Regular Guard' }} @else <i
            class="bi bi-exclamation-triangle me-1"></i>{{ 'Trainer Guard' }} @endif
</span>
