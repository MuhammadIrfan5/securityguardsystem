<?php

namespace App\Exports;

use App\Models\ConfirmationCall;
use Maatwebsite\Excel\Concerns\FromCollection;

class ExportConfirmationCall implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return ConfirmationCall::all();
    }
}
