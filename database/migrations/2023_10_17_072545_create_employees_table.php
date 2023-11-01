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
        Schema::create('employees', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users');
            $table->foreignId('category_id')->constrained('employee_categories');
            $table->string('name');
            $table->string('id_number');
            $table->string('phone_one');
            $table->string('phone_two')->nullable();
            $table->string('guard_number');
            $table->string('issue_date');
            $table->string('expiry_date');
            $table->string('pay_rate');
            $table->string('manager_name');
            $table->longText('notes')->nullable();
            $table->boolean('is_active');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employees');
    }
};
