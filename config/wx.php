<?php
return [
    'appid' => env('WX_APPID', ''),
    'secret' => env('WX_SECRET', ''),
    'redirect_uri' => env('WX_REDIRECTURI','http://readathon.athenaca.com/oauth'),
];