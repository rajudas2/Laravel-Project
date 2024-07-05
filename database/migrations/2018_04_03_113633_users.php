<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Users extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('user_id');
            $table->integer('fk_account_id');
            $table->integer('emp_id');
            $table->integer('added_by');
            $table->string('user_name');
            $table->string('user_status');
            $table->string('name');
            $table->string('role');
            $table->string('email')->unique();
            $table->longText('device_token');
            $table->string('department');
            $table->date('app_installation_date');
            $table->string('profile_pic');
            $table->string('profile_star');
            $table->string('location');
            $table->dateTime('last_login');
            $table->date('joining_date');
            //$table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
