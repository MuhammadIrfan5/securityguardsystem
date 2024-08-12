<?php

namespace App\Exports;

use App\Models\ConfirmationCall;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ExportConfirmationCall implements FromCollection, WithHeadings
{
    /**
     * @return \Illuminate\Support\Collection
     */
    protected $startDate;
    protected $endDate;

    public function __construct($startDate, $endDate)
    {
        $this->startDate = $startDate;
        $this->endDate = $endDate;
    }

    public function collection()
    {
        return ConfirmationCall::with(['user','employee','location'])
            ->whereBetween('created_at', [$this->startDate, $this->endDate])
            ->get()
            ->map(function ($confirmationCall) {
                return [
                    'ID'            => $confirmationCall->id,
                    'User Name'     => $confirmationCall->user->first_name,
                    'Time Sheet ID' => $confirmationCall->time_sheet_id,
                    'Schedule ID'   => $confirmationCall->schedule_id,
                    'Location ID'   => $confirmationCall->location->name,
                    'Employee ID'   => $confirmationCall->employee->name,
                    'Gate Combo'    => $confirmationCall->gate_combo,
                    'Call Time'     => $confirmationCall->call_time,
                    'Post Phone'    => $confirmationCall->post_phone,
                    'Status'        => $confirmationCall->status,
                    'Notes'         => $confirmationCall->notes,
                    'Created At'    => $confirmationCall->created_at,
                    'Updated At'    => $confirmationCall->updated_at,
                ];
            });
    }

    public function headings(): array
    {
        return [
            'ID',
            'User Name', // Updated heading
            'Time Sheet ID',
            'Schedule ID',
            'Location ID',
            'Employee ID',
            'Gate Combo',
            'Call Time',
            'Post Phone',
            'Status',
            'Notes',
            'Created At',
            'Updated At',
        ];
    }
}
