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
            $table->foreignId('time_sheet_id')->constrained('time_sheets');
            $table->foreignId('schedule_id')->constrained('schedules');
            $table->foreignId('location_id')->constrained('locations');
            $table->foreignId('employee_id')->constrained('employees');
            $table->string('gate_combo')->nullable();
            $table->string('call_time')->nullable();
            $table->string('post_phone')->nullable();
            $table->string('status')->nullable();
            $table->longText('notes')->nullable();
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
