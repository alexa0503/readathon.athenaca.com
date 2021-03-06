<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePrizesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('prizes', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->integer('winning_min_rank')->unsigned();
            $table->integer('winning_max_rank')->unsigned();
            $table->integer('winned_number')->unsigned();
            $table->longText('body');
            $table->integer('activity_id')->unsigned();
            $table->foreign('activity_id')->references('id')->on('activities');
            $table->integer('sort_id')->default(999);
            $table->timestamps();
        });
        
        Schema::create('prize_logs', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('prize_id')->unsigned();
            $table->foreign('prize_id')->references('id')->on('prizes');
            $table->integer('activity_id')->unsigned();
            $table->foreign('activity_id')->references('id')->on('activities');
            $table->integer('user_id')->unsigned();
            $table->foreign('user_id')->references('id')->on('users');
            $table->integer('rank')->unsigned();
            $table->boolean('has_checked');
            $table->timestamp('checked_at')->nullable();
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
        Schema::dropIfExists('prizes');
    }
}
