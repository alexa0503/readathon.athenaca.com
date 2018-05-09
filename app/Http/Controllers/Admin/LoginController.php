<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/admin';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('admin.guest')->except('logout');
    }
    protected function guard()
    {
        return Auth::guard('admin');
    }
    public function username()
    {
        return 'name';
    }
    public function showLogin()
    {
        //dd(bcrypt('admin123'));
        return view('admin.login');
    }
    protected function redirectTo()
    {
        return $this->redirectTo;
    }
    public function logout()
    {
        Auth::guard('admin')->logout();
        return redirect($this->redirectTo);
    }
}
