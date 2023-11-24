<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CalendarController extends Controller
{
    public function index()
    {
        $data['title'] = "Verify Records";

        return view('Admin.calendar.list',$data);
    }

    public function getEvents()
    {
        $events = Event::all();
        $formattedEvents = [];

        foreach ($events as $event) {
            $formattedEvents[] = [
                'title' => $event->title,
                'start' => $event->start_date,
                'end' => $event->end_date,
                'id' => $event->id,
            ];
        }

        return response()->json($formattedEvents);
    }

    public function addEvent(Request $request)
    {
        // Handle adding events
    }

    public function updateEvent(Request $request)
    {
        // Handle updating events
    }

    public function deleteEvent(Request $request)
    {
        // Handle deleting events
    }

}
