<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('time_sheets', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->foreignId('schedule_id')->constrained('schedules');
            $table->foreignId('employee_id')->constrained('employees');
            $table->foreignId('location_id')->constrained('locations');
            $table->string('check_in_time')->nullable();
            $table->string('check_out_time')->nullable();
            $table->longText('check_in_note')->nullable();
            $table->longText('check_out_note')->nullable();
            $table->boolean('is_approved')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('time_sheets');
    }
};
