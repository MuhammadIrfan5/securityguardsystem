<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('confirmation_calls', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->foreignId('schedule_id')->constrained('schedules');
            $table->foreignId('location_id')->constrained('locations');
            $table->foreignId('employee_id')->constrained('employees');
            $table->string('call_time');
            $table->string('status');
            $table->longText('notes');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('confirmation_calls');
    }
};
