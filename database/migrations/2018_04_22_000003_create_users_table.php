<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 100);
            $table->date('birthdate')->default('2018-01-01');
            $table->string('openid')->unique();
            $table->string('nickname', 100);
            $table->string('avatar');
            $table->integer('city_id')->unsigned();
            $table->foreign('city_id')->references('id')->on('cities');
            //$table->string('province', 100);
            //$table->string('country', 100);
            $table->string('tel', 100);
            $table->boolean('is_reading');
            $table->string('sex', 60);
            $table->boolean('is_activated');
            //$table->string('email')->unique();
            $table->integer('invite_id')->unsigned();
            $table->foreign('invite_id')->references('id')->on('users');
            //$table->string('password');
            //$table->rememberToken();
            $table->timestamps();
        });

        Schema::create('age_groups', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title', 100);
            $table->integer('min_age');
            $table->integer('max_age');
            $table->integer('sort_id');
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
        Schema::dropIfExists('age_group');
    }
}
