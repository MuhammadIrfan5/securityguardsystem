<td>
    <form method="POST"
          action="{{ $deleteUrl }}"
          class="d-inline-block">
        @method('DELETE')
        @csrf
        <button type="submit" class="" onclick="return confirm('Are you want to delete..!');"><i class="bi bi-trash"></i></button>
    </form>
</td>
