<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateActivitiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('activities', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->longText('body');
            $table->date('start_date');
            $table->date('end_date');
            $table->timestamps();
        });
        Schema::create('activity_users', function (Blueprint $table) {
            $table->integer('activity_id')->unsigned();
            $table->foreign('activity_id')->references('id')->on('activities');
            $table->integer('user_id')->unsigned();
            $table->foreign('user_id')->references('id')->on('users');
            $table->integer('city_id')->unsigned();
            $table->foreign('city_id')->references('id')->on('cities');
            $table->integer('age_group_id')->unsigned();
            $table->foreign('age_group_id')->references('id')->on('age_groups');
            $table->integer('reading_number')->unsigned();
            $table->integer('voted_number')->unsigned();
            $table->boolean('receive_status')->default(0);
            $table->primary(['user_id', 'activity_id']);
            $table->timestamps();
        });

        Schema::create('activity_logs', function (Blueprint $table) {
            $table->increments('id');
            //$table->string('title');
            $table->integer('activity_id')->unsigned();
            $table->foreign('activity_id')->references('id')->on('activities');
            $table->integer('user_id')->unsigned();
            $table->foreign('user_id')->references('id')->on('users');
            $table->integer('words_number')->default(0);
            $table->string('reason');
            $table->timestamps();
        });
        Schema::create('reading_logs', function (Blueprint $table) {
            $table->increments('id');
            //$table->string('title');
            $table->string('book_name');
            $table->integer('activity_id')->unsigned();
            $table->foreign('activity_id')->references('id')->on('activities');
            $table->integer('user_id')->unsigned();
            $table->foreign('user_id')->references('id')->on('users');
            $table->integer('words_number')->default(0);
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
        Schema::dropIfExists('activities');
        Schema::dropIfExists('activity_users');
        Schema::dropIfExists('activity_logs');
        Schema::dropIfExists('reading_logs');
    }
}
