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
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->foreignId('role_id')->constrained('roles');
            $table->string('first_name');
            $table->string('last_name');
            $table->string('middle_name')->nullable();
            $table->string('email')->unique();
            $table->string('secondary_email')->nullable();
            $table->string('phone1')->unique();
            $table->string('phone2')->nullable();
            $table->string('address');
            $table->string('dob');
            $table->string('age')->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->string('opt')->nullable();
            $table->string('opt_expiry')->nullable();
            $table->softDeletes();
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
