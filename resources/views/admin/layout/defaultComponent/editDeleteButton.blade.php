<td>
    <a href="{{$editUrl}}" target="_blank" class="">
        <i class="bx bxs-pencil"></i>
    </a>
    <form method="POST"
          action="{{ $deleteUrl }}"
          class="d-inline-block">
        @method('DELETE')
        @csrf
        <button type="submit" class="" onclick="return confirm('Are you want to delete..!');"  ><i class="bi bi-trash"></i></button>
    </form>
</td>
